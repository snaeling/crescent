import 'package:crescent/src/features/authentication/data/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// implementation of Andrea Bizzotto's auth flow,
// https://codewithandrea.com/articles/flutter-presentation-layer/

class Credentials {
  final String email;
  final String password;

  Credentials(this.email, this.password);
}

class LogInController extends StateNotifier<AsyncValue<void>> {
  LogInController({required this.userRepository})
      : super(const AsyncData<void>(null));

  final UserRepository userRepository;

  Future<void> logIn(String email, String password) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(() {
      return offload([email, password]);
    });
  }

  Future<void> offload(List<String> credentials) async {
    await userRepository.logIn(credentials[0], credentials[1]);
  }
}

final logInControllerProvider =
    StateNotifierProvider.autoDispose<LogInController, AsyncValue<void>>((ref) {
  return LogInController(
    userRepository: ref.watch(userRepositoryProvider),
  );
});
