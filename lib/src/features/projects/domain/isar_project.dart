import 'package:cohost_api/cohost.dart';
import 'package:isar/isar.dart';

part 'isar_project.g.dart';

@collection
class IsarProject {
  IsarProject({
    required this.id,
    required this.handle,
    required this.displayName,
    required this.dek,
    required this.description,
    required this.avatarPreviewURL,
    required this.headerPreviewURL,
    required this.privacy,
    required this.pronouns,
    required this.url,
    required this.flags,
    required this.avatarShape,
  }) : ttl = DateTime.now().add(const Duration(days: 20));

  IsarProject.fromProject(Project project,
      [Duration ttl = const Duration(days: 5)])
      : id = project.projectId,
        handle = project.handle,
        displayName = project.displayName,
        dek = project.dek,
        description = project.description,
        avatarPreviewURL = project.avatarPreviewURL,
        headerPreviewURL = project.headerPreviewURL,
        privacy = project.privacy!,
        pronouns = project.pronouns,
        url = project.url,
        flags = project.flags,
        avatarShape = project.avatarShape!,
        ttl = DateTime.now().add(ttl);

  Id? id;

  @Index(unique: true, replace: true)
  String? handle;

  String? displayName;

  String? dek;

  String? description;

  String? avatarPreviewURL;

  String? headerPreviewURL;

  @enumerated
  late PrivacyType privacy;

  String? pronouns;

  String? url;

  List<String>? flags;

  @enumerated
  late AvatarShape avatarShape;

  @Index()
  final DateTime ttl;

  Project toProject() {
    return Project(
      handle: handle!,
      projectId: id!,
      displayName: displayName,
      dek: dek,
      description: description,
      avatarPreviewURL: avatarPreviewURL,
      headerPreviewURL: headerPreviewURL,
      pronouns: pronouns,
      url: url,
      avatarShape: avatarShape,
      privacy: privacy,
      flags: flags,
    );
  }
}
