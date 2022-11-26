import 'package:crescent/src/features/authentication/application/auth_provider.dart';
import 'package:crescent/src/utils/secure_storage_service.dart';
import 'package:cohost_api/cohost.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'user_repository.g.dart';

class UserRepository {
  UserRepository(this.api, this.ref);
  // TODO: auth stream
  // final _authState = InMemoryStore<User?>(null);

  // Stream<User?> authStateChanges() => _authState.stream;
  // User? get currentUser => _authState.value;

  final Cohost api;
  final Ref ref;

  Future<void> logIn(String email, String password) async {
    var res = await api.user.login(email: email, password: password);

    ref.watch(secureStorageServiceProvider).storeCookie(res);
  }

  Future<void> logInWithCookie(String cookie) async {
    var res = await api.user.login(cookie: cookie);

    ref.watch(secureStorageServiceProvider).storeCookie(res);
  }

  //void dispose() => _authState.close();
}

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  UserRepository repository = UserRepository(Cohost(), ref);
  return repository;
}
