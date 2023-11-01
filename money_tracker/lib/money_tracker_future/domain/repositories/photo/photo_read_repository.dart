import 'dart:io';

import 'package:money_tracker/money_tracker_future/domain/domain.dart';

abstract class PhotoReadRepository {

  Future<APhotosModel> readCounter({required String locator});

  Future<(File?, String?)> writeCounter({required String? locator});

  Future<bool?> deletePhoto({required String locator});
}
