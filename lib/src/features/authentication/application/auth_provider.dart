import 'dart:async';

import 'package:cohost_api/cohost.dart';
import 'package:crescent/src/features/authentication/data/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// implementation of Andrea Bizzotto's auth flow,
// https://codewithandrea.com/articles/flutter-presentation-layer/

part 'auth_provider.freezed.dart';

final logInControllerProvider =
    StateNotifierProvider.autoDispose<LogInController, AsyncValue<void>>((ref) {
  return LogInController(
    userRepository: ref.watch(userRepositoryProvider),
  );
});

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
    await userRepository.logIn(email: credentials[0], password: credentials[1]);
  }
}

@freezed
class UserState with _$UserState {
  const factory UserState({
    User? user,
    @Default(false) bool loggedIn,
  }) = _UserState;

  const UserState._();
}

class AuthNotifier extends StateNotifier<UserState> {
  AuthNotifier(this.ref) : super(const UserState()) {
    _init();
  }

  User? user;
  final Ref ref;

  _init() async {
    User auth = await ref.watch(userRepositoryProvider).loggedIn();
    state = state.copyWith(loggedIn: auth.loggedIn);
    Timer.periodic(const Duration(seconds: 30), (timer) async {
      auth = await ref.watch(userRepositoryProvider).loggedIn();
      state = state.copyWith(loggedIn: auth.loggedIn);
      print(state.loggedIn);
    });
  }

  setAuthState(bool bool) {
    state = state.copyWith(loggedIn: bool);
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, UserState>((ref) {
  return AuthNotifier(ref);
});
