import 'package:money_tracker/money_tracker_future/data/data.dart';

abstract class PhotoFromIntFile {

  Future<PhotosModel?> read({required String uuid});

  Future<PhotosModel?> write({required String uuid, required String path});

  Future<bool> delete({required String uuid});
}
