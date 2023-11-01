
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
//import 'package:injectable/injectable.dart';


part 'photo_bloc.freezed.dart';
part 'photo_event.dart';
part 'photo_state.dart';
part 'photo_data.dart';


//@injectable
class PhotoBloc extends Bloc<PhotoBlocEvent, PhotoBlocState>{

  final PhotoReadRepository photoReadRepository;


  static int timeOutV = 10;

  PhotoModelData photoModelData = const PhotoModelData(
    timeOut: false,
    data: null,
    e: '',
    error: false,
  );

  PhotoBloc({
    required this.photoReadRepository,
  }) : super(const PhotoBlocState.loading()) {
    on<PhotoBlocEvent>((event, emit) async {
      await event.map<FutureOr<void>>(
          init: (value) => _read(value.uuid, emit),
          read: (value) => _read(value.uuid, emit),
          write: (value) async {
            final (error, timeOut, e, res) = await _runGoSData<bool>(
              function: () async =>
              await photoReadRepository.write(
                uuid: value.uuid,
                path: value.path,
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
          },
          delete: (value) async {
              final (error, timeOut, e, res) = await _runGoSData<bool>(
                function: () async =>
                await photoReadRepository.delete(
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

    // on<UsersBlocEvent>((event, emit) async {
    //   await event.map<FutureOr<void>>(
    //       init: (value) async {
    //         emit(const UsersBlocState.loading());
    //         await _get(0);
    //         //await Future.delayed(const Duration(seconds: 2));
    //         _response(emit);
    //       },
    //       get: (value) async {
    //         emit(const UsersBlocState.loading());
    //         await _get(value.page);
    //         //await Future.delayed(const Duration(seconds: 2));
    //         _response(emit);
    //       },
    //       getCompleter: (value) async {
    //         await _get(value.page);
    //         //await Future.delayed(const Duration(seconds: 2));
    //         _response(emit);
    //         value.completer.complete();
    //       },
    //       insert: (value) async {
    //         emit(const UsersBlocState.loading());
    //         await _insert(value.value);
    //         //await Future.delayed(const Duration(seconds: 2));
    //         _response(emit);
    //       },
    //       update: (value) async {
    //         await _update(value.oldValue, value.value);
    //        // await Future.delayed(const Duration(seconds: 2));
    //       },
    //       delete: (value) async {
    //         emit(const UsersBlocState.loading());
    //         await _delete(value.value);
    //         //await Future.delayed(const Duration(seconds: 2));
    //         _response(emit);
    //       },
    //       insertCard: (value) async {
    //         final (_, _, _) = await _insertCard(value: value.value);
    //       },
    //       updateCard: (value) async {
    //         final (_, _, _) = await _updateCard(value: value.value);
    //       },
    //   );
    // });
  }

  Future<void> _read(String uuid, Emitter<PhotoBlocState> emit) async {
    emit(const PhotoBlocState.loading());
    if(uuid == '') {
      emit(const PhotoBlocState.loaded(model:  null));
    } else {
      final (error, timeOut, e, res) = await _runGoSData<APhotosEntity>(
        function: () async =>
        await photoReadRepository.read(
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
        emit(PhotoBlocState.loaded(model:  photoModelData.data));
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
      await Future.delayed(const Duration(microseconds: 500));
      res = await function().timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut = true;
            e = 'TimeOut';
            return null;
          });
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
