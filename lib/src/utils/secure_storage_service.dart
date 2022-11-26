import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage_service.g.dart';

class SecureStorageService {
  final FlutterSecureStorage storage;

  SecureStorageService() : storage = const FlutterSecureStorage();

  storeCookie(String cookie) async {
    await storage.write(key: 'cookie', value: cookie);
  }

  Future<String?> getCookie() async {
    return await storage.read(key: 'cookie');
  }

  write({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  read({required String key}) async {
    await storage.read(key: key);
  }
}

@Riverpod(keepAlive: true)
SecureStorageService secureStorageService(SecureStorageServiceRef ref) {
  return SecureStorageService();
}
