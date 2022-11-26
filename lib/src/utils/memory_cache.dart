import 'package:cohost_api/cohost.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'memory_cache.g.dart';

class MemoryCache {
  Map<String, Map<String, dynamic>> store = {
    'posts': {},
    'projects': {},
  };

  void add(dynamic object) async {
    var postStore = store['posts'] as Map<String, dynamic>;
    if (object is Post) {
      postStore[object.postId.toString()] = object;
      for (var post in object.shareTree) {
        if (postStore.containsKey(post.postId)) {
          //skip storing post if there's a more complete version of it available
          if ((postStore[post.postId] as Post).shareTree.isNotEmpty &&
              post.shareTree.isEmpty) {
            continue;
          }
        }
        store['posts']![post.postId.toString()] = post;
        store['projects']![post.postingProject.handle.toString()] =
            post.postingProject;
        for (var proj in post.relatedProjects) {
          store['projects']![proj.handle.toString()] = proj;
        }
      }
    } else if (object is Project) {
      store['projects']![object.handle.toString()] = object;
    }
  }

  void addAll(List<dynamic> objects) async {
    for (var obj in objects) {
      add(obj);
    }
  }

  dynamic retrieveSync({required String type, required String key}) {
    return store[type]![key];
  }
}

@Riverpod(keepAlive: true)
MemoryCache memoryCache(MemoryCacheRef ref) {
  return MemoryCache();
}
