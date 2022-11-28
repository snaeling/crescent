import 'package:cohost_api/cohost.dart';
import 'package:crescent/src/features/authentication/application/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_provider.freezed.dart';

@freezed
class PostState with _$PostState {
  const factory PostState({
    int? id,
    Post? post,
    Post? postDisplayed,
    String? displayName,
    @Default(0) int truncateAt,
    @Default(0) int hiddenPosts,
    @Default(false) bool isShare,
    @Default(false) bool isLiked,
    @Default(false) bool crime,
    @Default(false) bool showPostToggle,
    @Default(true) bool showPost,
  }) = _PostState;

  const PostState._();
}

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier(this.ref, this.post) : super(const PostState()) {
    _init();
  }

  final Ref ref;
  final Post post;

  _init() async {
    // Get our prefs, generate factory default prefs if we don't have them.
    UserDisplayPrefs? prefs = ref.read(authProvider).userState?.displayPrefs;
    prefs = prefs ?? const UserDisplayPrefs();

    // default post variables
    var estimatedLength = 0;
    var shareDiscongruence = 0;
    var truncateAt = 0;
    final isShare = post.transparentShareOfPostId != null;
    bool crime = false;
    Post postDisplayed = post;
    bool showPost = true;
    bool showPostToggle = false;

    if (isShare) {
      post.shareTree.reversed.toList().forEach((element) {
        if (element.postId == post.transparentShareOfPostId) {
          postDisplayed = element;
          return;
        }
        shareDiscongruence++;
      });
    }

    final html = RegExp(r'<\/?[a-z][\s\S]*>', caseSensitive: false);
    // bunch of things not supported by the flutter_html parsing library
    final List<String> cssCrimes = [
      'animation:',
      'border-radius:',
      'filter:',
      'position:',
      'aspect-ratio:',
      '-webkit',
      'background:'
    ];
    var body = postDisplayed.plainTextBody;
    if (html.hasMatch(postDisplayed.plainTextBody)) {
      if (body.contains("style=")) {
        for (var element in cssCrimes) {
          if (body.contains(element)) {
            crime = true;
            break;
          }
        }
      }
    }

    if (postDisplayed.blocks!.length > 1 && !crime) {
      for (var index = 0; index < postDisplayed.blocks!.length; index++) {
        var block = postDisplayed.blocks![index];
        estimatedLength += block.type == PostBlockType.attachment
            ? 700
            : block.markdown!.content!.length;
        if (estimatedLength > 1700) {
          // if this block is the last block, dont truncate
          truncateAt = postDisplayed.blocks!.length > index ? index : 0;
          break;
        }
      }
    }

    // TODO: remove hidden posts from hide count
    shareDiscongruence = shareDiscongruence > 0 ? 1 : 0;
    int hiddenPosts = post.shareTree.isNotEmpty
        ? (post.blocks!.isNotEmpty
            ? (post.shareTree.length - shareDiscongruence)
            : (post.shareTree.length - 1 - shareDiscongruence))
        : 0;

    bool autoExandCw = true;

    for (String postCw in postDisplayed.cws) {
      if (prefs.autoexpandCWs.contains(postCw)) {
        continue;
      }
      autoExandCw = false;
    }

    if ((postDisplayed.cws.isNotEmpty && !autoExandCw) ||
        (postDisplayed.effectiveAdultContent &&
            prefs.explicitlyCollapseAdultContent)) {
      showPost = false;
      showPostToggle = true;
    }
    if (postDisplayed.effectiveAdultContent) {
      showPostToggle = true;
    }

    state = state.copyWith(
      id: post.postId,
      crime: crime,
      post: post,
      postDisplayed: postDisplayed,
      showPost: showPost,
      truncateAt: truncateAt,
      hiddenPosts: hiddenPosts,
      showPostToggle: showPostToggle,
    );
  }

  toggleVisibility() {
    state = state.copyWith(showPost: !state.showPost);
  }
}

final postProvider = StateNotifierProvider.autoDispose
    .family<PostNotifier, PostState, Post>((ref, post) {
  ref.keepAlive();
  return PostNotifier(ref, post);
});


// @riverpod
// FeedNotifier feedNotifier(FeedNotifierRef ref, {required FeedConfig config}) {
//   return FeedNotifier(ref, config);
// }
