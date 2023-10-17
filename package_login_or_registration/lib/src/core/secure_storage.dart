
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorage{

  Future<void> write({
    required String key,
    required String? value,
  });

  Future<void> delete({required String key});

  Future<String?> read({required String key});
}

class SecureStorageImpl extends SecureStorage {
  // Create storage
  final FlutterSecureStorage storage;

  SecureStorageImpl({required this.storage});

  @override
  Future<void> write({
    required String key,
    required String? value,
  }) async {
    await storage.write(key: key, value: value);
  }

  @override
  Future<void> delete({required String key}) async {
    await storage.delete(key: key);
  }

  @override
  Future<String?> read({required String key}) async {
    return await storage.read(key: key);
  }
}
