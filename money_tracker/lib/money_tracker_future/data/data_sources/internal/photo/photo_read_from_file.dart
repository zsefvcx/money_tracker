
import 'dart:io';

import 'package:money_tracker/money_tracker_future/data/data.dart';

abstract class PhotoReadFromIntFile {

  Future<String> get localPath;

  Future<(File, String)> localFile({String? locator});

  Future<PhotosEntity> readCounter({required String locator});

  Future<(File, String)> writeCounter({String? locator});

  Future<bool> deletePhoto({required String locator});
}
