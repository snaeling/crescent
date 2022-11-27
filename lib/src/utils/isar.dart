import 'dart:io';

import 'package:cohost_api/cohost.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/projects/domain/isar_project.dart';

part 'isar.g.dart';

/// The Isar service is primarily used for local caching data, such project data.
///
/// Prefer passing the object directly to the route rather than accessing
/// this database, however, synchronous retrival should complete within 2ms.
///
/// Entries are set to expire after 5 days, and we search and delete them
/// once per instance.
///
/// Isar does not suppot encryption, so we should use
/// `flutter_secure_storage` for any sensitive information!
///
/// ### [savePost]
/// Converts a single [Post] to [IsarPost] and saves it, and any project
/// information.
///
/// ### [savePosts]
/// Converts a list of [Post] to [IsarPost] and saves them, with correct
/// linking for all involved elements.
class IsarCacheService {
  //final Duration ttl = const Duration(days: 10);
  late Future<Isar> database;
  late Isar _isar;

  IsarCacheService() {
    database = _openDatabase();
    _initIsar();
    // Handle expired database entries when the app is opened.
    // If there's a better way to do this, oops!
    _deleteExpiredRows();
  }

  // TODO: move to specific data category in project domain etc
  // also rename now that I'm not needlessly caching posts.
  Future<void> savePost(Post post) async {
    // TODO: savePost should take a SinglePost rather than Post.
    List<IsarProject> iProjs = [];
    iProjs.add(IsarProject.fromProject(post.postingProject));
    for (var sharedPost in post.shareTree) {
      // Shared posts will not contain related projects.
      iProjs.add(IsarProject.fromProject(sharedPost.postingProject));
    }
    for (var relatedProject in post.relatedProjects) {
      iProjs.add(IsarProject.fromProject(relatedProject));
    }
    final isar = await database;
    isar.writeTxn(() => isar.isarProjects.putAll(iProjs));
  }

  Future<void> savePosts(List<Post> posts) async {
    List<IsarProject> iProjs = [];
    for (Post post in posts) {
      var currProj = IsarProject.fromProject(post.postingProject);
      iProjs.add(currProj);
      for (var sharedPost in post.shareTree) {
        var currProj = IsarProject.fromProject(sharedPost.postingProject);
        iProjs.add(currProj);
      }
      for (var relatedProject in post.relatedProjects) {
        var currProj = IsarProject.fromProject(relatedProject);
        iProjs.add(currProj);
      }
    }
  }

  Future<void> saveProjects(List<Project> projects) async {
    List<IsarProject> iProjs = [];
    for (Project project in projects) {
      iProjs.add(IsarProject.fromProject(project));
    }

    final isar = await database;
    isar.writeTxn(() => isar.isarProjects.putAll(iProjs));
  }

  IsarProject? getProjectSync(String handle) {
    return _isar.isarProjects.getByHandleSync(handle);
  }

  // @deprecated
  // Future<Post> getPost(String handle, int id) async {
  //   final isar = await database;
  //   final post = await isar.isarPosts.get(id);
  //   return post!.toPost();
  // }

  Future<void> _deleteExpiredRows() async {
    final isar = await database;
    await isar.isarProjects.filter().ttlLessThan(DateTime.now()).deleteAll();
  }

  Future<Isar> _openDatabase() async {
    Directory tempDir = await getTemporaryDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [IsarProjectSchema],
        inspector: true,
        directory: tempDir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  void _initIsar() async {
    _isar = await database;
  }
}

@Riverpod(keepAlive: true)
IsarCacheService isarCacheService(IsarCacheServiceRef ref) {
  final service = IsarCacheService();
  return service;
}
