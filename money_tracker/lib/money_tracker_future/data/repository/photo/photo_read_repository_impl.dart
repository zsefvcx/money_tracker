
import 'dart:io';

import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

class PhotoReadRepositoryImpl extends PhotoReadRepository{

  final PhotoReadFromIntFile photoReadFromIntFile;

  PhotoReadRepositoryImpl({
    required this.photoReadFromIntFile,
  });

  @override
  Future<APhotosEntity?> read({required String uuid}) async {
    return await photoReadFromIntFile.read(uuid: uuid);
  }

  @override
  Future<bool?> write({required String uuid, required String path}) async {
    return await photoReadFromIntFile.write(uuid: uuid, path: path);
  }

  @override
  Future<bool?> delete({required String uuid}) async {
    return await photoReadFromIntFile.delete(uuid: uuid);
  }


}
