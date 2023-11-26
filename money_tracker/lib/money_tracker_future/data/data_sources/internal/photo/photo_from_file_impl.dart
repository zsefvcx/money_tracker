
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:path_provider/path_provider.dart';

class PhotoFromIntFileImpl extends PhotoFromIntFile {

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
  Future<PhotosModel?> read({required String uuid}) async {
    try {
      final res = mapPhotosModel[uuid];
      if(res == null) { //еще не разу не грузили за сессию
        final file = await localFile(uuid: uuid);
        final contents = await file.readAsBytes();
        Logger.print(file.path);
        Logger.print('${contents.length}');
        return mapPhotosModelAdd(uuid, contents);
      } else {
        return res;
      }
    } on Exception catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw ArgumentError('Error read!');
    }
  }

  Future<Uint8List?> compressWithImageCompress(
      {required String path, required int quality}) async {

    final response = await FlutterImageCompress.compressWithFile(
      path,
      minWidth: 320~/4,
      minHeight: 240~/4,
      quality: quality,
    );
    Logger.print(path);
    Logger.print('${response?.length}');
    return response;

  }

  @override
  Future<PhotosModel?> write({required String uuid, required String path}) async {
    try {
      final file = await localFile(uuid: uuid);

      Uint8List filePathContent;
      if (!(Platform.isMacOS   || Platform.isLinux || Platform.isWindows)) {
        filePathContent = (await compressWithImageCompress(
          path: path,
          quality: 80,
        ))??(await File(path).readAsBytes());
      } else {
        filePathContent = await File(path).readAsBytes();
      }

      final fileWrite = await file.writeAsBytes(filePathContent);

      final res = mapPhotosModel[uuid];
      if(res != null) {
        mapPhotosModel.remove(uuid);
      }

      return mapPhotosModelAdd(uuid, await fileWrite.readAsBytes());

    } on Exception catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw ArgumentError('Error write!');
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
      throw ArgumentError('Error delete!');
    }
  }
}
