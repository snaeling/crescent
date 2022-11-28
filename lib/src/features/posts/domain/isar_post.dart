// import 'package:cohost_api/cohost.dart';
// import 'package:isar/isar.dart';

// import '../../projects/domain/isar_project.dart';

// part 'isar_post.g.dart';

// @collection
// class IsarPost {
//   IsarPost({
//     required this.id,
//     required this.headline,
//     required this.publishedAt,
//     required this.filename,
//     required this.transparentShareOfPostId,
//     required this.state,
//     required this.numComments,
//     required this.numSharedComments,
//     required this.cws,
//     required this.tags,
//     required this.blocks,
//     required this.plainTextBody,
//     required this.singlePostPageUrl,
//     required this.effectiveAdultContent,
//     required this.isEditor,
//     required this.contributorBlockIncomingOrOutgoing,
//     required this.hasAnyContributorMuted,
//     required this.postEditUrl,
//     required this.isLiked,
//     required this.canShare,
//     required this.canPublish,
//     required this.hasCohostPlus,
//     required this.pinned,
//     required this.commentsLocked,
//   }) : ttl = DateTime.now().add(const Duration(days: 5));

//   /// 🥴
//   IsarPost.fromPost(Post post, [Duration ttl = const Duration(days: 5)])
//       : id = post.postId,
//         headline = post.headline,
//         publishedAt = post.publishedAt,
//         filename = post.filename,
//         transparentShareOfPostId = post.transparentShareOfPostId,
//         state = post.state,
//         numComments = post.numComments,
//         numSharedComments = post.numSharedComments,
//         cws = post.cws,
//         tags = post.tags,
//         blocks = IsarEmbeddedPostBlock.fromPostBlocks(post.blocks!),
//         plainTextBody = post.plainTextBody,
//         singlePostPageUrl = post.singlePostPageUrl,
//         effectiveAdultContent = post.effectiveAdultContent,
//         isEditor = post.isEditor,
//         contributorBlockIncomingOrOutgoing =
//             post.contributorBlockIncomingOrOutgoing,
//         hasAnyContributorMuted = post.hasAnyContributorMuted,
//         postEditUrl = post.postEditUrl,
//         isLiked = post.isLiked,
//         canShare = post.canShare,
//         canPublish = post.canPublish,
//         hasCohostPlus = post.hasCohostPlus,
//         pinned = post.pinned,
//         commentsLocked = post.commentsLocked,
//         ttl = DateTime.now().add(ttl);

//   Id? id;
//   String? headline;
//   DateTime? publishedAt;
//   String? filename;
//   int? transparentShareOfPostId;
//   int? state;
//   int? numComments;
//   int? numSharedComments;
//   List<String>? cws;
//   List<String>? tags;
//   List<IsarEmbeddedPostBlock>? blocks;
//   String? plainTextBody;
//   final postingProject = IsarLink<IsarProject>();
//   final shareTree = IsarLinks<IsarPost>();
//   final relatedProjects = IsarLinks<IsarProject>();
//   String? singlePostPageUrl;
//   bool? effectiveAdultContent;
//   bool? isEditor;
//   bool? contributorBlockIncomingOrOutgoing;
//   bool? hasAnyContributorMuted;
//   String? postEditUrl;
//   bool? isLiked;
//   bool? canShare;
//   bool? canPublish;
//   bool? hasCohostPlus;
//   bool? pinned;
//   bool? commentsLocked;

//   @Index()
//   final DateTime ttl;

//   Post toPost() {
//     return Post(
//       postId: id!,
//       headline: headline!,
//       publishedAt: publishedAt!,
//       filename: filename!,
//       state: state!,
//       numComments: numComments!,
//       numSharedComments: numSharedComments!,
//       cws: cws!,
//       tags: tags!,
//       blocks: IsarEmbeddedPostBlock.toPostBlocks(blocks!),
//       plainTextBody: plainTextBody!,
//       postingProject: postingProject.value!.toProject(),
//       shareTree: linkedPostsToList(shareTree),
//       relatedProjects: linkedProjectsToList(relatedProjects),
//       singlePostPageUrl: singlePostPageUrl!,
//       effectiveAdultContent: effectiveAdultContent!,
//       isEditor: isEditor!,
//       contributorBlockIncomingOrOutgoing: contributorBlockIncomingOrOutgoing!,
//       hasAnyContributorMuted: hasAnyContributorMuted!,
//       postEditUrl: postEditUrl!,
//       isLiked: isLiked!,
//       canShare: canShare!,
//       canPublish: canPublish!,
//       hasCohostPlus: hasCohostPlus!,
//       pinned: pinned!,
//       commentsLocked: commentsLocked!,
//     );
//   }

//   // this could be a generic method for cohost data classes with a bit of
//   // better design unless it would break isar code gen but i doubt it
//   static List<Post> linkedPostsToList(IsarLinks<IsarPost> links) {
//     List<Post> list = [];
//     for (IsarPost link in links) {
//       list.add(link.toPost());
//     }
//     return list;
//   }

//   static List<Project> linkedProjectsToList(IsarLinks<IsarProject> links) {
//     List<Project> list = [];
//     for (IsarProject link in links) {
//       list.add(link.toProject());
//     }
//     return list;
//   }

//   static List<int> grabProjectIds(List<Project> projects) {
//     List<int> list = [];
//     for (Project project in projects) {
//       list.add(project.projectId);
//     }
//     return list;
//   }
// }

// @embedded
// class IsarEmbeddedPostBlock {
//   IsarEmbeddedPostBlock({
//     this.type = PostBlockType.markdown,
//     this.fileUrl,
//     this.previewUrl,
//     this.attachmentId,
//     this.altText,
//     this.content,
//   });
//   @enumerated
//   late PostBlockType type;

//   final String? fileUrl;

//   final String? previewUrl;

//   final String? attachmentId;

//   final String? altText;

//   final String? content;

//   static List<IsarEmbeddedPostBlock> fromPostBlocks(List<PostBlock> blocks) {
//     List<IsarEmbeddedPostBlock> list = [];
//     for (PostBlock block in blocks) {
//       list.add(
//         IsarEmbeddedPostBlock(
//           altText: block.altText,
//           attachmentId: block.attachmentId,
//           content: block.content,
//           fileUrl: block.fileUrl,
//           previewUrl: block.previewUrl,
//           type: block.type!,
//         ),
//       );
//     }
//     return list;
//   }

//   static List<PostBlock> toPostBlocks(List<IsarEmbeddedPostBlock> blocks) {
//     List<PostBlock> list = [];
//     for (var i = 0; i > blocks.length; i++) {
//       list.add(
//         PostBlock(
//           altText: blocks[i].altText,
//           attachmentId: blocks[i].attachmentId,
//           content: blocks[i].content,
//           fileUrl: blocks[i].fileUrl,
//           previewUrl: blocks[i].previewUrl,
//           type: blocks[i].type,
//         ),
//       );
//     }
//     return list;
//   }
// }
