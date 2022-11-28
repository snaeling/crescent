import 'dart:async';

import 'package:cohost_api/cohost.dart';
import 'package:crescent/src/features/authentication/data/user_repository.dart';
import 'package:crescent/src/utils/secure_storage_service.dart';
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
class AppUserState with _$AppUserState {
  const factory AppUserState(
      {User? user,
      @Default(false) bool loggedIn,
      UserState? userState}) = _AppUserState;

  const AppUserState._();
}

class AuthNotifier extends StateNotifier<AppUserState> {
  AuthNotifier(this.ref) : super(const AppUserState()) {
    _init();
  }

  User? user;
  final Ref ref;

  _init() async {
    User auth = await ref.watch(userRepositoryProvider).loggedIn();
    state = state.copyWith(loggedIn: auth.loggedIn, user: auth);
    UserState userState = await ref
        .watch(userRepositoryProvider)
        .getUserState(state.user!.projectHandle!);
    state = state.copyWith(userState: userState);
    Timer.periodic(const Duration(seconds: 30), (timer) async {
      // TODO: this must only run in the foreground
      auth = await ref.watch(userRepositoryProvider).loggedIn();
      state = state.copyWith(loggedIn: auth.loggedIn);
    });
  }

  setAuthState(bool bool) {
    state = state.copyWith(loggedIn: bool);
  }

  logOut() async {
    state = state.copyWith(user: null, loggedIn: false);
    ref.watch(secureStorageServiceProvider).retireCookie();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AppUserState>((ref) {
  return AuthNotifier(ref);
});
