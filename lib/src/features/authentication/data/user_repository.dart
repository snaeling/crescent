import 'package:crescent/src/features/authentication/application/auth_provider.dart';
import 'package:crescent/src/utils/secure_storage_service.dart';
import 'package:cohost_api/cohost.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'user_repository.g.dart';

class UserRepository {
  UserRepository(this.api, this.ref) {
    _init();
  }
  // TODO: auth stream
  // final _authState = InMemoryStore<User?>(null);

  // User? get currentUser => _authState.value;

  final Cohost api;
  final Ref ref;

  Future<bool> logIn({String? cookie, String? email, String? password}) async {
    var res =
        await api.user.login(cookie: cookie, email: email, password: password);
    ref.watch(secureStorageServiceProvider).storeCookie(res);
    var valid = (await loggedIn()).loggedIn;
    if (valid) {
      ref.watch(secureStorageServiceProvider).storeCookie(res);
    }
    return valid;
  }

  Future<bool> logInWithCookie(String cookie) async {
    var res = await logIn(cookie: cookie);

    return res;
  }

  Future<User> loggedIn() async {
    var res = await api.user.loggedIn();
    ref.watch(authProvider.notifier).setAuthState(res.loggedIn);
    return res;
  }

  _init() {}
  //void dispose() => _authState.close();
}

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  UserRepository repository = UserRepository(Cohost(), ref);
  return repository;
}
