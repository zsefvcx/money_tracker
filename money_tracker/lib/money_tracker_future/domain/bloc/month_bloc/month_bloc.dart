import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
//import 'package:injectable/injectable.dart';

part 'month_bloc.freezed.dart';
part 'month_event.dart';
part 'month_state.dart';
part 'month_data.dart';

//@injectable
class MonthBloc extends Bloc<MonthBlocEvent, MonthBlocState>{

  final MonthRepository monthRepository;

  static int timeOutV = 10;

  MonthModelData monthModelData = const MonthModelData(
    timeOut: false,
    data: null,
    e: '',
    error: false,
  );

  MonthBloc({
    required this.monthRepository,
  }) : super(const MonthBlocState.loading()) {
    on<MonthBlocEvent>((event, emit) async {
      await event.map<FutureOr<void>>(
          init: (value) async => await _read(value.uuid, emit),
          read: (value) async => await _read(value.uuid, emit),
          add: (value) async {
            final (error, timeOut, e, res) = await _runGoSData<MonthAllowedEntity>(
                        function: () async =>
                        await monthRepository.add(
                          uuid: value.uuid,
                          month: value.month,
                        ),
                      );
                      monthModelData = monthModelData.copyWithData(
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
                    await monthRepository.delete(
                      uuid: value.uuid,
                    ),
                  );
                  monthModelData = monthModelData.copyWithData(
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

  Future<void> _read(String uuid, Emitter<MonthBlocState> emit) async {
    emit(const MonthBlocState.loading());
      final (error, timeOut, e, res) = await _runGoSData<MonthAllowedEntity>(
        function: () async =>
        await monthRepository.read(uuid: uuid),
      );
      monthModelData = monthModelData.copyWithData(
        data: res,
        timeOut: timeOut,
        error: error,
        e: e,
      );
      await _response(emit);
  }

  Future<void> _response(Emitter<MonthBlocState> emit) async {
    if (monthModelData.error){
      if(monthModelData.timeOut){
        emit(const MonthBlocState.timeOut());
      } else {
        emit(const MonthBlocState.error());
      }
    } else{
      final data = monthModelData.data;
      if (data != null) {
        emit(MonthBlocState.loaded(model:  monthModelData.data));
      } else {
        Logger.print('Data not loaded.', name: 'err', error: true);
        emit(const MonthBlocState.error());
        monthModelData = monthModelData.copyWithData(
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
      await Future.delayed(const Duration(milliseconds: 50));
      res = await function().timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut = true;
            e = 'TimeOut';
            return null;
          });
      if (kDebugMode) {
        print(res);
      }
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
