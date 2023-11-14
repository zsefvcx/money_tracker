import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
//import 'package:injectable/injectable.dart';

part 'categories_bloc.freezed.dart';
part 'categories_event.dart';
part 'categories_state.dart';
part 'categories_data.dart';

//@injectable
class CategoriesBloc extends Bloc<CategoriesBlocEvent, CategoriesBlocState>{

  final CategoriesRepository _categoriesRepository;

  static int timeOutV = 10;

  CategoriesModelData modelData = const CategoriesModelData(
    timeOut: false,
    data: null,
    e: '',
    error: false,
  );

  CategoriesBloc({
    required CategoriesRepository categoriesRepository,
  }) : _categoriesRepository = categoriesRepository, super(const CategoriesBlocState.loading()) {
    on<CategoriesBlocEvent>((event, emit) async {
      await event.map<FutureOr<void>>(
          init: (value) async {
            emit(const CategoriesBlocState.loading());
            final (error, timeOut, e, res) = await _runGoSData<CategoriesExpensesModels>(
              function: () async =>
              await _categoriesRepository.getAllId(uuid: value.uuid),
            );
            modelData = modelData.copyWithData(
              data: res,
              timeOut: timeOut,
              error: error,
              e: e,
            );
            await _response(emit);
          },
          read: (value) async {
            // final (error, timeOut, e, res) = await _runGoSData<MonthsCurrentYearEntity>(
            //   function: () async =>
            //   await _monthRepository.findAllInYear(uuid: value.uuid, year: value.year),
            // );
            // final data =  res;
            // final monthCurrent = categoriesModelData.monthCurrent;
            // categoriesModelData = categoriesModelData.copyWithData(
            //   data: data,
            //   monthCurrent: monthCurrent,
            //   timeOut: timeOut,
            //   error: error,
            //   e: e,
            // );
            //   if (error){
            //     Logger.print('Error _read.:$timeOut:$e', name: 'err', error: true);
            //     value.completer.completeError(error);
            //   } else {
            //     value.completer.complete(res);
            //   }
          },
          add: (value) async {
            // final (error, timeOut, e, res) = await _runGoSData<MonthCurrent>(
            //             function: () async =>
            //             await _monthRepository.insert(uuid: value.uuid, data: value.data),
            //           );
            //
            // final data =  categoriesModelData.data;
            // final monthCurrent = res;
            // if(!error && res !=null && data != null &&
            //     data.year == value.data.year && data.uuid == value.uuid) {
            //   if(res.id!=null)data.months.add(value.data.month);
            // }
            // categoriesModelData = categoriesModelData.copyWithData(
            //   data: data,
            //   monthCurrent: monthCurrent,
            //   timeOut: timeOut,
            //   error: error,
            //   e: e,
            // );
            // if (error){
            //   Logger.print('Error add.:$timeOut:$e', name: 'err', error: true);
            //   value.completer.completeError(error);
            // } else {
            //   value.completer.complete(res?.id);
            // }
          },
          delete: (value) async {
            emit(const CategoriesBlocState.loading());
            final (error, timeOut, e, res) = await _runGoSData<bool>(
              function: () async =>
                await _categoriesRepository.delete(uuid: value.uuid),
              );

            if(!error && res !=null && res){

              final (error2, timeOut2, e2, res2) = await _runGoSData<CategoriesExpensesModels>(
                function: () async =>
                await _categoriesRepository.getAllId(uuid: value.uuid),
              );
              modelData = modelData.copyWithData(
                data: res2,
                timeOut: timeOut2,
                error: error2,
                e: e2,
              );
            } else {
              modelData = modelData.copyWithData(
                data: null,
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

  Future<void> _response(Emitter<CategoriesBlocState> emit) async {
    if (modelData.error){
      if(modelData.timeOut){
        emit(const CategoriesBlocState.timeOut());
      } else {
        emit(const CategoriesBlocState.error());
      }
    } else{
      final data = modelData.data;
      if (data != null) {
        emit(CategoriesBlocState.loaded(model: modelData.data,));
      } else {
        Logger.print('Data not loaded.', name: 'err', error: true);
        emit(const CategoriesBlocState.error());
        modelData = modelData.copyWithData(
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
