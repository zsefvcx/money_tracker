import 'dart:io';

import 'package:money_tracker/money_tracker_future/domain/domain.dart';

abstract class PhotoReadRepository {

  Future<APhotosEntity?> read({required String uuid});

  Future<bool?> write({required String uuid, required String path});

  Future<bool?> delete({required String uuid});
}
