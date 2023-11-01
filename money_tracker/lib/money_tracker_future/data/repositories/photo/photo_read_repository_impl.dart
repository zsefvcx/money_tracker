
import 'dart:io';

import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

class PhotoReadRepositoryImpl extends PhotoReadRepository{

  final PhotoReadFromIntFile photoReadFromIntFile;

  PhotoReadRepositoryImpl({
    required this.photoReadFromIntFile,
  });

  @override
  Future<APhotosModel> readCounter({required String locator}) async {
    return await photoReadFromIntFile.readCounter(locator: locator);
  }

  @override
  Future<(File?, String?)> writeCounter({required String? locator}) async {
    return await photoReadFromIntFile.writeCounter(locator: locator);
  }

  @override
  Future<bool?> deletePhoto({required String locator}) async {
    return await photoReadFromIntFile.deletePhoto(locator: locator);
  }


}
