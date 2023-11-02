
import 'dart:io';

import 'package:money_tracker/core/logger/logger.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:path_provider/path_provider.dart';

class MonthsStatusImpl extends MonthsStatus {

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


  final Map<String, MonthAllowedModel>  mapMonthAllowedModel =  {};

  MonthAllowedModel mapPhotosModelAdd(String uuid, MonthAllowedModel model){
    //Добавляем в оперативку >30 файлов, чтобы база не грузила операивку
    final val = mapMonthAllowedModel[uuid];
    if  ((val != null && val != model) || val == null){
      mapMonthAllowedModel[uuid] = model;
      if(mapMonthAllowedModel.length > 30){
        final uuidFirst = mapMonthAllowedModel.keys.first;
        mapMonthAllowedModel.remove(uuidFirst);
      }
      return model;
    } else {
      return val;
    }
  }

  Future<String> get localPath async {
    final directory = await getApplicationSupportDirectory();
    return directory.path;
  }

  Future<File> localFile({required String uuid}) async {
    final path = '${await localPath}/month_$uuid.db';
    Logger.print('PathToPhoto:$path');
    return File(path);
  }


  @override
  Future<MonthAllowedModel?> read({required String uuid}) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<MonthAllowedModel?> add({required String uuid, required int month}) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<bool?> delete({required String uuid}) async {
    try {
      final file = await localFile(uuid: uuid);
      await file.delete();
      final res = mapMonthAllowedModel[uuid];
      if(res != null) {
        mapMonthAllowedModel.remove(uuid);
      }
      return true;
    } on Exception catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw ArgumentError('Error delete month db!');
    }
  }

}
