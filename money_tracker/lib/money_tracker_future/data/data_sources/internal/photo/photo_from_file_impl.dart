
import 'dart:io';
import 'dart:typed_data';

import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:path_provider/path_provider.dart';

class PhotoFromIntFileImpl extends PhotoFromIntFile {

  MonthEnableDao? dao;

  Future<void> _initDataBaseFloor() async {
    final database = await $FloorAppDatabase
        .databaseBuilder('users_database.db')
        .build();
    dao = database.monthEnableDao;
  }

/*  @override
  Future<User?> insert(User value) async {
    try{
      if(dbType == DBType.sqflite) {
        return await DBProvider.db.insert(value);
      } else if (dbType == DBType.floor) {
        if(dao == null) await _initDataBaseFloor();
        final daoLocal = dao;
        if(daoLocal !=null) {
          final id = await daoLocal.insertUser(value);
          return value.copyWith(
            id: id,
          );
        }
        throw ArgumentError('Error insertGroup');
    } else {
    throw ArgumentError('not implemented');
    }
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error insertGroup: $e\n$t');
    }
  }

  @override
  Future<int> delete(User value) async {
    final gid = value.id;
    try {
      if (gid != null) {
        if(dbType == DBType.sqflite) {
          return await DBProvider.db.delete(gid);
        } else if (dbType == DBType.floor) {
          if(dao == null) await _initDataBaseFloor();
          final daoLocal = dao;
          if(daoLocal !=null) {
            return await daoLocal.deleteUser(value);
          }
          throw ArgumentError('Error insertGroup');
        } else {
          throw ArgumentError('not implemented');
        }
      }
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error deleteGroup: $e\n$t');
    }
    throw ArgumentError('Error deleteGroup');
  }

  @override
  Future<List<User>?> get(int page) async {
    try {
      if(dbType == DBType.sqflite) {
        return await DBProvider.db.get(page);
      } else if (dbType == DBType.floor) {
        if(dao == null) await _initDataBaseFloor();
        final daoLocal = dao;
        if(daoLocal !=null) {
          return await daoLocal.get();
        }
        throw ArgumentError('Error insertGroup');
      } else {
        throw ArgumentError('not implemented');
      }
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error getGroups: $e\n$t');
    }
  }

  @override
  Future<int> update(User value) async {
    try {
      if (dbType == DBType.sqflite) {
        return await DBProvider.db.update(value);
      } else if (dbType == DBType.floor) {
        if (dao == null) await _initDataBaseFloor();
        final daoLocal = dao;
        if (daoLocal != null) {
          return await daoLocal.updateUser(value);
        }
        throw ArgumentError('Error insertGroup');
      } else {
        throw ArgumentError('not implemented');
      }
    } on Exception catch (e, t) {
      throw ArgumentError('Error insertGroup: $e\n$t');
    }
  }*/


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
  Future<PhotosModel?> write({required String uuid, required String path}) async {
    try {
      final file = await localFile(uuid: uuid);

      final filePathContent = await File(path).readAsBytes();

      final fileWrite = await file.writeAsBytes(filePathContent);

      final res = mapPhotosModel[uuid];
      if(res != null) {
        mapPhotosModel.remove(uuid);
      }

      return mapPhotosModelAdd(uuid, await fileWrite.readAsBytes());

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
