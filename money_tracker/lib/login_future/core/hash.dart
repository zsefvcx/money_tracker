
import 'dart:convert' as conv;

import 'package:hash/hash.dart';

class Hash {
  static String hashSHA512(String value) {
    final hash = conv.utf8.encode(value);
    return SHA512().update(hash).digest().join('.');
  }

}
