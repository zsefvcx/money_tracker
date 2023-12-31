import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
//import 'package:injectable/injectable.dart';

part 'month_bloc.freezed.dart';
part 'month_event.dart';
part 'month_state.dart';
part 'month_data.dart';

//@injectable
class MonthBloc extends Bloc<MonthBlocEvent, MonthBlocState>{

  final MonthRepository _monthRepository;

  static int timeOutV = 10;

  MonthModelData modelData = const MonthModelData(
    timeOut: false,
    data: null,
    monthCurrent: null,
    e: '',
    error: false,
  );

  MonthBloc({
    required MonthRepository monthRepository,
  }) : _monthRepository = monthRepository, super(const MonthBlocState.loading()) {
    on<MonthBlocEvent>((event, emit) async {
      await event.map<FutureOr<void>>(
          init: (value) async {
            emit(const MonthBlocState.loading());
            final (error, timeOut, e, res) = await _runGoSData<MonthCurrent>(
              function: () async =>
              _monthRepository.insert(uuid: value.uuid, data: value.data),
            );
            final data =  modelData.data;
            final monthCurrent = res;
            modelData = modelData.copyWithData(
              data: data,
              monthCurrent: monthCurrent,
              timeOut: timeOut,
              error: error,
              e: e,
            );
            final completer = value.completer;
            if(completer != null){
              if (error){
                Logger.print('Error init month.:$timeOut:$e', name: 'err', error: true);
                completer.completeError(error);
              } else {
                completer.complete(res?.id);
              }
            } else {
              await _response(emit);
            }
          },
          read: (value) async {
            final (error, timeOut, e, res) = await _runGoSData<MonthsCurrentYearEntity>(
              function: () async =>
              _monthRepository.findAllInYear(uuid: value.uuid, year: value.year),
            );
            final data =  res;
            final monthCurrent = modelData.monthCurrent;
            modelData = modelData.copyWithData(
              data: data,
              monthCurrent: monthCurrent,
              timeOut: timeOut,
              error: error,
              e: e,
            );
              if (error){
                Logger.print('Error read month.:$timeOut:$e', name: 'err', error: true);
                value.completer.completeError(error);
              } else {
                value.completer.complete(res);
              }
          },
          add: (value) async {
            final (error, timeOut, e, res) = await _runGoSData<MonthCurrent>(
                        function: () async =>
                        _monthRepository.insert(uuid: value.uuid, data: value.data),
                      );

            final data =  modelData.data;
            final monthCurrent = res;
            modelData = modelData.copyWithData(
              data: data,
              monthCurrent: monthCurrent,
              timeOut: timeOut,
              error: error,
              e: e,
            );
            final completer = value.completer;
            if(completer != null){
              if (error){
                Logger.print('Error add month.:$timeOut:$e', name: 'err', error: true);
                completer.completeError(error);
              } else {
                completer.complete(res?.id);
              }
            } else {
              await _response(emit);
            }
          },
          delete: (value) async {
            emit(const MonthBlocState.loading());
            final (error, timeOut, e, res) = await _runGoSData<bool>(
              function: () async =>
                _monthRepository.delete(uuid: value.uuid),
              );

            if(!error && res !=null && res){

              final (error2, timeOut2, e2, res2) = await _runGoSData<MonthCurrent>(
                function: () async =>
                _monthRepository.insert(uuid: value.uuid, data: value.data),
              );
              modelData = modelData.copyWithData(
                data: null,
                monthCurrent: res2,
                timeOut: timeOut2,
                error: error2,
                e: e2,
              );
            } else {
              modelData = modelData.copyWithData(
                data: null,
                monthCurrent: null,
                timeOut: timeOut,
                error: error,
                e: e,
              );
            }
            await _response(emit);
          }
      );
    });
  }

  Future<void> _response(Emitter<MonthBlocState> emit) async {
    if (modelData.error){
      if(modelData.timeOut){
        emit(const MonthBlocState.timeOut());
      } else {
        emit(const MonthBlocState.error());
      }
    } else{
      final data = modelData.data;
      final monthCurrent = modelData.monthCurrent;
      if (data != null || monthCurrent != null) {
        emit(MonthBlocState.loaded(entity: data, monthCurrent: monthCurrent));
      } else {
        Logger.print('Data not loaded.', name: 'err', error: true);
        emit(const MonthBlocState.error());
        modelData = modelData.copyWithData(
          monthCurrent: null,
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
