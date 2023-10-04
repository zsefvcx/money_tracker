import 'dart:convert' as conv;

import 'package:flutter/foundation.dart';
import 'package:hash/hash.dart';

class UserAuthorizationPassword {

  static final sha512 = SHA512();

  static String hashSHA512(String value) {
    final hash = conv.utf8.encode(value);
    //return conv.utf8.decode(res);
  if (kDebugMode) {
    print(hash);
    print(conv.utf8.decode(hash));
  }

    return sha512.update(hash).;
  }



}
