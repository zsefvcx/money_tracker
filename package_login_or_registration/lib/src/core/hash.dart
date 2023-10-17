import 'dart:convert' as conv;

import 'package:flutter/foundation.dart';
import 'package:hash/hash.dart';

class Hash {
  static String hashSHA512(String value) {
    final hash = conv.utf8.encode(value);
    if (kDebugMode) {
      print(hash);
      print(conv.utf8.decode(hash));
      print('SHA512 digest as bytes: ${SHA512().update(hash).digest()}');
    }
    return SHA512().update(hash).digest().join('.');
  }

}
