import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
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
            emit(const CategoriesBlocState.loading());
            final (error, timeOut, e, res) = await _runGoSData<CategoriesExpensesModels>(
                        function: () async =>
                        await _categoriesRepository.insert(uuid: value.uuid, data: value.data),
                      );
            modelData = modelData.copyWithData(
              data: res,
              timeOut: timeOut,
              error: error,
              e: e,
            );
            await _response(emit);
          },
          delete: (value) async {
            emit(const CategoriesBlocState.loading());
            final (error, timeOut, e, res) = await _runGoSData<bool>(
              function: () async =>
                await _categoriesRepository.delete(uuid: value.uuid),
              );
              modelData = modelData.copyWithData(
              data: (res!=null && res)?const CategoriesExpenses(
                categoriesId: <CategoryExpenses>{}
              ):null,
              timeOut: timeOut,
              error: error,
              e: e,
            );

            await _response(emit);
          },
          deleteId: (value) async {
            emit(const CategoriesBlocState.loading());
            final (error, timeOut, e, res) = await _runGoSData<CategoriesExpensesModels>(
              function: () async =>
              await _categoriesRepository.deleteId(uuid: value.uuid, id: value.id),
            );
            modelData = modelData.copyWithData(
              data: res,
              timeOut: timeOut,
              error: error,
              e: e,
            );
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
        emit(CategoriesBlocState.loaded(model: data,));
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
