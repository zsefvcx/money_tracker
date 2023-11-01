
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
//import 'package:injectable/injectable.dart';

part 'photo_bloc.freezed.dart';
part 'photo_event.dart';
part 'photo_state.dart';
part 'ptoto_data.dart';

//@injectable
class PhotoBloc extends Bloc<PhotoBlocEvent, PhotoBlocState>{

  final PhotoReadRepository photoReadRepository;


  static int timeOutV = 10;

  UsersModelData usersModelData = const UsersModelData(
    timeOut: false,
    data: UsersModel(<User>{}, 0),
    e: '',
    error: false,
  );

  PhotoBloc({
    required this.photoReadRepository,
  }) : super(const PhotoBlocState.loading()) {
    on<UsersBlocEvent>((event, emit) async {
      await event.map<FutureOr<void>>(
          init: (value) async {
            emit(const UsersBlocState.loading());
            await _get(0);
            //await Future.delayed(const Duration(seconds: 2));
            _response(emit);
          },
          get: (value) async {
            emit(const UsersBlocState.loading());
            await _get(value.page);
            //await Future.delayed(const Duration(seconds: 2));
            _response(emit);
          },
          getCompleter: (value) async {
            await _get(value.page);
            //await Future.delayed(const Duration(seconds: 2));
            _response(emit);
            value.completer.complete();
          },
          insert: (value) async {
            emit(const UsersBlocState.loading());
            await _insert(value.value);
            //await Future.delayed(const Duration(seconds: 2));
            _response(emit);
          },
          update: (value) async {
            await _update(value.oldValue, value.value);
           // await Future.delayed(const Duration(seconds: 2));
          },
          delete: (value) async {
            emit(const UsersBlocState.loading());
            await _delete(value.value);
            //await Future.delayed(const Duration(seconds: 2));
            _response(emit);
          },
          insertCard: (value) async {
            final (_, _, _) = await _insertCard(value: value.value);
          },
          updateCard: (value) async {
            final (_, _, _) = await _updateCard(value: value.value);
          },
      );
    });
  }

  Future<(bool, bool, bool?)> _insertCard({required CardDetail value}) async {
    var error = false;
    var timeOut = false;
    bool? res;
    try{
      res = await cardSecureRepository.insertCard(value: value).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut  = true;
            return null;
          });
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
    }
    return (error, timeOut, res);
  }

  Future<(bool, bool, CardDetail?)> readCard({required String uuidUser}) async {
    var error = false;
    var timeOut = false;
    CardDetail? res;
    try{
      res = await cardSecureRepository.readCard(uuidUser: uuidUser).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut  = true;
            return null;
          });
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
    }
    return (error, timeOut, res);
  }

  Future<(bool, bool, bool?)> _updateCard({required CardDetail value}) async {
    var error = false;
    var timeOut = false;
    bool? res;
    try{
      res = await cardSecureRepository.updateCard(value: value).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut  = true;
            return null;
          });
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
    }
    return (error, timeOut, res);
  }

  Future<(bool, bool, bool?)> _deleteCard({required String uuidUser}) async {
    var error = false;
    var timeOut = false;
    bool? res;
    try{
      res = await cardSecureRepository.deleteCard(uuidUser: uuidUser).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut  = true;
            return null;
          });
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
    }
    return (error, timeOut, res);
  }

  Future<APhotosModel?> getUint8List(String locator, String url) async {
    APhotosModel? res;
    try{
      res = await photoReadRepository.readCounter(locator: locator, url: url);
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
    }
    return res;
  }

  Future<(bool, bool, String?)> _insertPhoto({required String url, String? locator}) async {
    var error = false;
    var timeOut = false;
    String? res;
    try{
      res = (await photoReadRepository.writeCounter(url: url, locator: locator).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut  = true;
            return (null, null);
          })

      ).$2;
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
    }
    return (error, timeOut, res);
  }

  Future<(bool, bool, bool?)> _deletePhoto({required String locator}) async {
    var error = false;
    var timeOut = false;
    bool? res;
    try{
      res = await photoReadRepository.deletePhoto(locator: locator).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut  = true;
            return null;
          });
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
    }
    return (error, timeOut, res);
  }

  void _response(Emitter<UsersBlocState> emit){
    if (usersModelData.error){
      if(usersModelData.timeOut){
        emit(const UsersBlocState.timeOut());
      } else {
        emit(const UsersBlocState.error());
      }
    } else{
      emit(UsersBlocState.loaded(model: usersModelData));
    }
  }

  Future<void> _get(int page) async {
    AUsersEntity? groupsModel;
    String? e;
    var error = false;
    bool? timeOut;
    try {
      //получаем первую страницу при инициализации
      final res = await usersRepository.get(page: page).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            e = null;
            error = true;
            timeOut  = true;
            return null;
          });
      if (res != null) {
        final AUsersEntity getModel = UsersModel(res.toSet(), page);
        if(getModel == usersModelData.data){
          Logger.print('Identical! No need load data.', name: 'err', error: true);
        } else {
          groupsModel = getModel;
        }

      }
    } on Exception catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print('$ee\n$t', name: 'err', error: true);
    }
    usersModelData = usersModelData.copyWith(
      data: groupsModel,
      timeOut: timeOut,
      e: e,
      error: error,
    );

  }

  Future<void> _insert(User value) async {
    String? e;
    var error = false;
    bool? timeOut;
    try {
      final locator= (await _insertPhoto(url: value.image, locator: value.locator)).$3;
      if(locator == null) {
        Logger.print('Image is not loaded');
      }
      final valueRes = value.copyWith(
        locator: locator,
      );
      final res = await usersRepository.insert(value: valueRes).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            e = null;
            error = true;
            timeOut  = true;
            return null;
          });
      if (res != null) {
        usersModelData.data.users.add(res);
      }
    } on Exception catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print('$ee\n$t', name: 'err', error: true);
    }
    usersModelData = usersModelData.copyWith(
      timeOut: timeOut,
      e: e,
      error: error,
    );
  }

  Future<void> _update(User oldValue, User value) async {
    String? e;
    var error = false;
    bool? timeOut;
    try {
      var valueRes = value;
      if(value.image != oldValue.image || oldValue.locator == null){
        final locator= (await _insertPhoto(url: value.image, locator: value.locator)).$3;
        if(locator == null) {
          Logger.print('Image is not loaded');
        }
        valueRes = value.copyWith(
          locator: locator,
        );
      }
      final res = await usersRepository.update(value: valueRes).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            e = null;
            error = true;
            timeOut  = true;
            return 0;
          });
      if (res > 0) {
        usersModelData.data.users.remove(oldValue);
        usersModelData.data.users.add(value);
      }
    } on Exception catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print('$ee\n$t', name: 'err', error: true);
    }
    usersModelData = usersModelData.copyWith(
      timeOut: timeOut,
      e: e,
      error: error,
    );
  }

  Future<void> _delete(User value) async {
    String? e;
    bool? error = false;
    bool? timeOut;
    try {
      await _deleteCard(uuidUser: value.uuid);
      await _deletePhoto(locator: value.locator??'');
      final res = await usersRepository.delete(value: value).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            e = null;
            error = true;
            timeOut  = true;
            return 0xFF;
          });
      if (res > 0)
      {
        usersModelData.data.users.remove(value);
      }
    } on Exception catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print('$ee\n$t', name: 'err', error: true);
    }
    usersModelData = usersModelData.copyWith(
      timeOut: timeOut,
      e: e,
      error: error,
    );
  }
}
