import 'dart:convert';

import 'package:crescent/src/features/authentication/application/auth_provider.dart';
import 'package:crescent/src/utils/secure_storage_service.dart';
import 'package:cohost_api/cohost.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'user_repository.g.dart';

class LoginDetails {
  final String? cookie;
  final String? email;
  final String? password;

  LoginDetails(this.cookie, this.email, this.password);
}

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
    // String? clientHash;
    // if (cookie == null) {
    //   final salt = await api.user.salt(email: email!);
    //   final algo = await Pbkdf2SecretKey.importRawKey(
    //     utf8.encode(password!),
    //   );
    //   final key = await algo.deriveBits(
    //     128,
    //     Hash.sha256,
    //     salt,
    //     200000,
    //   );
    //   clientHash = base64.encode(key);
    // }

    var res = await compute(computeLogin, <String, dynamic>{
      "cookie": cookie,
      "email": email,
      "password": password
    });

    api.http.setCookie = res;
    var valid = (await loggedIn()).loggedIn;
    if (valid) {
      ref.watch(secureStorageServiceProvider).storeCookie(res);
    }
    return valid;
  }

  static Future<String> computeLogin(Map<String, dynamic> a) async {
    return await Cohost()
        .user
        .login(cookie: a['cookie'], email: a['email'], password: a['password']);
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

  Future<UserState> getUserState(String handle) async {
    var res = await api.user.userState(handle);
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
