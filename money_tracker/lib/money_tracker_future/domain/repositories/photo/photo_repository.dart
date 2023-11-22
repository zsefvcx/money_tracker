import 'package:money_tracker/money_tracker_future/domain/domain.dart';

abstract class PhotoRepository {
  Future<PhotosEntity?> read({required String uuid});

  Future<PhotosEntity?> write({required String uuid, required String path});

  Future<bool?> delete({required String uuid});
}
