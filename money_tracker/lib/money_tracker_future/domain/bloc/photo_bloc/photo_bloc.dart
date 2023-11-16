import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
//import 'package:injectable/injectable.dart';

part 'photo_bloc.freezed.dart';
part 'photo_event.dart';
part 'photo_state.dart';
part 'photo_data.dart';

//@injectable
class PhotoBloc extends Bloc<PhotoBlocEvent, PhotoBlocState>{

  final PhotoRepository photoRepository;

  static int timeOutV = 10;

  PhotoModelData photoModelData = const PhotoModelData(
    timeOut: false,
    data: null,
    e: '',
    error: false,
  );

  PhotoBloc({
    required this.photoRepository,
  }) : super(const PhotoBlocState.loading()) {
    on<PhotoBlocEvent>((event, emit) async {
      await event.map<FutureOr<void>>(
          init: (value) async => await _read(value.uuid, emit),
          read: (value) async => await _read(value.uuid, emit),
          write: (value) async {
            final (error, timeOut, e, res) = await _runGoSData<APhotosEntity>(
              function: () async =>
              await photoRepository.write(
                uuid: value.uuid,
                path: value.path,
              ),
            );
            photoModelData = photoModelData.copyWithData(
              data: res,
              timeOut: timeOut,
              error: error,
              e: e,
            );
            await _response(emit);
            if (error){
              Logger.print('Error checkUserName.:$timeOut:$e', name: 'err', error: true);
              value.completer.completeError(error);
            } else {
              value.completer.complete(res!=null);
            }
          },
          delete: (value) async {
              final (error, timeOut, e, res) = await _runGoSData<bool>(
                function: () async =>
                await photoRepository.delete(
                    uuid: value.uuid
                ),
              );
              photoModelData = photoModelData.copyWithData(
                data: null,
                timeOut: timeOut,
                error: error,
                e: e,
              );
              if (error){
                Logger.print('Error checkUserName.:$timeOut:$e', name: 'err', error: true);
                value.completer.completeError(error);
              } else {
                value.completer.complete(res);
              }
          }
      );
    });
  }

  Future<void> _read(String uuid, Emitter<PhotoBlocState> emit) async {
    emit(const PhotoBlocState.loading());
    if(uuid == '') {
      emit(const PhotoBlocState.loaded(model:  null));
    } else {
      final (error, timeOut, e, res) = await _runGoSData<APhotosEntity>(
        function: () async =>
        await photoRepository.read(
            uuid: uuid
        ),
      );
      photoModelData = photoModelData.copyWithData(
        data: res,
        timeOut: timeOut,
        error: error,
        e: e,
      );
      await _response(emit);
    }
  }


  Future<void> _response(Emitter<PhotoBlocState> emit) async {
    if (photoModelData.error){
      if(photoModelData.timeOut){
        emit(const PhotoBlocState.timeOut());
      } else {
        emit(const PhotoBlocState.error());
      }
    } else{
      final data = photoModelData.data;
      if (data != null) {
        emit(PhotoBlocState.loaded(model:  data));
      } else {
        Logger.print('Data not loaded.', name: 'err', error: true);
        emit(const PhotoBlocState.error());
        photoModelData = photoModelData.copyWithData(
          timeOut: false,
          data: null,
          e: 'Data not loaded.',
          error: true,
        );
      }
    }
  }

  Future<(bool, bool, String, T?)> _runGoSData<T>({required Future<T?> Function() function}) async {
    var error = false;
    var timeOut = false;
    var e = '';
    T? res;
    try {
      res = await function().timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut = true;
            e = 'TimeOut';
            return null;
          });
      Logger.print('res: $res', name: 'res');
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
      e = ee.toString();
      //ignore: avoid_catches_without_on_clauses
    } catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
      e = ee.toString();
    }
    return (error, timeOut, e, res);
  }

}
