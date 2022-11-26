import 'package:crescent/src/features/posts/domain/isar_post.dart';
import 'package:cohost_api/cohost.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/isar.dart';

// class IsarPostRepository {
//   final IsarService service;
//   IsarPostRepository(this.service);

//   Future<void> test() async {
//     final isar = await service.database;
//     Stream<IsarPost?> userChanged = isar.isarPosts.watchObject(111);
//     userChanged.listen((newUser) {
//       print('User changed: ${newUser?.name}');
//     });
//   }
// }

// class SearchCritera {
//   final String handle;
//   final int id;

//   SearchCritera(this.handle, this.id);
// }

// final postStreamProvider =
//     StreamProvider.autoDispose.family<Post, SearchCritera>((ref, criteria) {
//   final service = ref.watch(isarServiceProvider);
//   final isar =  service.database;
//   Stream<IsarPost?> userChanged = isar.isarPosts.watchObject(111);
//     userChanged.listen((newUser) {
//       print('User changed: ${newUser?.name}');
//     });
// });
