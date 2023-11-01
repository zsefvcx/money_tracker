
import 'dart:io';
import 'dart:typed_data';


import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:path_provider/path_provider.dart';

class PhotoReadFromIntFileImpl extends PhotoReadFromIntFile {

  final Map<String, PhotosModel>  mapPhotosModel =  {};

  PhotosModel mapPhotosModelAdd(String uuid, Uint8List contents){
    //Добавляем в оперативку >30 файлов, чтобы база не грузила операивку
    final val = mapPhotosModel[uuid];
    if  (val == null){
      final photosModel = PhotosModel(
        contents: contents,
        uuid: uuid,
      );
      mapPhotosModel[uuid] = photosModel;
      if(mapPhotosModel.length > 30){
        final uuidFirst = mapPhotosModel.keys.first;
        mapPhotosModel.remove(uuidFirst);
      }
      return photosModel;
    } else {
      return val;
    }
  }

  Future<String> get localPath async {
    final directory = await getApplicationSupportDirectory();
    return directory.path;
  }

  Future<File> localFile({required String uuid}) async {

    final path = '${await localPath}/photo_$uuid';
    Logger.print('PathToPhoto:$path');
    return File(path);
  }

  @override
  Future<PhotosModel> read({required String uuid}) async {
    try {
      final res = mapPhotosModel[uuid];
      if(res == null) { //еще не разу не грузили за сессию
        final file = await localFile(uuid: uuid);
        final contents = await file.readAsBytes();
        return mapPhotosModelAdd(uuid, contents);
      } else {
        return res;
      }
    } on Exception catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw ArgumentError('Error readCounter!');
    }
  }

  @override
  Future<bool?> write({required String uuid, required String path}) async {
    try {
      final file = await localFile(uuid: uuid);

      final filePathContent = await File(path).readAsBytes();

      final fileLocal = await file.writeAsBytes(filePathContent);

      return fileLocal.path==path;

    } on Exception catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw ArgumentError('Error writeCounter!');
    }
  }

  @override
  Future<bool> delete({required String uuid}) async {
    try {
      final file = await localFile(uuid: uuid);
      await file.delete();
      final res = mapPhotosModel[uuid];
      if(res != null) {
        mapPhotosModel.remove(uuid);
      }
      return true;
    } on Exception catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw ArgumentError('Error deletePhoto!');
    }
  }
}
