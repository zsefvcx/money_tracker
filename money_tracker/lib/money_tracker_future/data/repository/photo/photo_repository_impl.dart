import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

class PhotoRepositoryImpl extends PhotoRepository{

  final PhotoFromIntFile photoFromIntFile;

  PhotoRepositoryImpl({
    required this.photoFromIntFile,
  });

  @override
  Future<APhotosEntity?> read({required String uuid}) async {
    return await photoFromIntFile.read(uuid: uuid);
  }

  @override
  Future<APhotosEntity?> write({required String uuid, required String path}) async {
    return await photoFromIntFile.write(uuid: uuid, path: path);
  }

  @override
  Future<bool?> delete({required String uuid}) async {
    return await photoFromIntFile.delete(uuid: uuid);
  }


}
