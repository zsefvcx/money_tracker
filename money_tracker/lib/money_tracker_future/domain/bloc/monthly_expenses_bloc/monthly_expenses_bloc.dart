import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
//import 'package:injectable/injectable.dart';

part 'monthly_expenses_bloc.freezed.dart';
part 'monthly_expenses_event.dart';
part 'monthly_expenses_state.dart';
part 'monthly_expenses_data.dart';

//@injectable
class MonthlyExpensesBloc extends Bloc<MonthlyExpensesBlocEvent, MonthlyExpensesBlocState>{

  final MonthlyExpensesRepository _monthlyExpensesRepository;

  static int timeOutV = 10;

  MonthlyExpensesModelData modelData = const MonthlyExpensesModelData(
    timeOut: false,
    data: null,
    e: '',
    error: false,
  );

  MonthlyExpensesBloc({
    required MonthlyExpensesRepository monthlyExpensesRepository,
  }) : _monthlyExpensesRepository = monthlyExpensesRepository, super(const MonthlyExpensesBlocState.loading()) {
    on<MonthlyExpensesBlocEvent>((event, emit) async {
      await event.map<FutureOr<void>>(
          init: (value) {
            // TODO: implement read
            throw UnimplementedError();
          },
          read: (value) {
            // TODO: implement read
            throw UnimplementedError();
          },
          readTotal: (value) async {
            final (error, timeOut, e, res) = await _runGoSData<BigInt>(
              function: () async =>
              await _monthlyExpensesRepository.getTotalInMonthCategory(
                  uuid: value.uuid,
                  idMonth: value.idMonth,
                  idCategory: value.idCategory),
            );
            modelData = modelData.copyWithData(
              data: null,
              timeOut: timeOut,
              error: error,
              e: e,
            );
            if (error){
              Logger.print('Error add.:$timeOut:$e', name: 'err', error: true);
              value.completer.completeError(error);
            } else {
              value.completer.complete(res);
            }
          },
          add: (value) async {
            final (error, timeOut, e, res) = await _runGoSData<bool>(
              function: () async =>
                await _monthlyExpensesRepository.insert(uuid: value.uuid, data: value.data),
            );
            modelData = modelData.copyWithData(
              data: null,
              timeOut: timeOut,
              error: error,
              e: e,
            );
            if (error){
              Logger.print('Error add.:$timeOut:$e', name: 'err', error: true);
              value.completer.completeError(error);
            } else {
              value.completer.complete(res);
            }
          },
          delete: (value) {
            // TODO: implement read
            throw UnimplementedError();
          },
          update: (value) {
            // TODO: implement read
            throw UnimplementedError();
          },
          check: (value) {
            // TODO: implement read
            throw UnimplementedError();
          },
          deleteId: (value) {
            // TODO: implement read
            throw UnimplementedError();
          },



    //       init: (value) async {
    //         emit(const CategoriesBlocState.loading());
    //         final (error, timeOut, e, res) = await _runGoSData<CategoriesExpensesModels>(
    //           function: () async =>
    //           await _categoriesRepository.getAllId(uuid: value.uuid),
    //         );
    //         modelData = modelData.copyWithData(
    //           data: res,
    //           timeOut: timeOut,
    //           error: error,
    //           e: e,
    //         );
    //         await _response(emit);
    //       },
    //       read: (value) async {
    //         // TODO: implement read
    //         throw UnimplementedError();
    //       },
    //       add: (value) async {
    //         emit(const CategoriesBlocState.loading());
    //         final (error, timeOut, e, res) = await _runGoSData<CategoriesExpensesModels>(
    //           function: () async =>
    //           await _categoriesRepository.insert(uuid: value.uuid, data: value.data),
    //         );
    //         modelData = modelData.copyWithData(
    //           data: res,
    //           timeOut: timeOut,
    //           error: error,
    //           e: e,
    //         );
    //         await _response(emit);
    //       },
    //       delete: (value) async {
    //         emit(const CategoriesBlocState.loading());
    //         final (error, timeOut, e, res) = await _runGoSData<bool>(
    //           function: () async =>
    //           await _categoriesRepository.delete(uuid: value.uuid),
    //         );
    //         modelData = modelData.copyWithData(
    //           data: (res!=null && res)?const CategoriesExpenses(
    //               categoriesId: <CategoryExpenses>{}
    //           ):null,
    //           timeOut: timeOut,
    //           error: error,
    //           e: e,
    //         );
    //
    //         await _response(emit);
    //       },
    //       deleteId: (value) async {
    //         final (error, timeOut, e, res) = await _runGoSData<CategoriesExpensesModels>(
    //           function: () async =>
    //           await _categoriesRepository.deleteId(uuid: value.uuid, id: value.id),
    //         );
    //         modelData = modelData.copyWithData(
    //           data: res,
    //           timeOut: timeOut,
    //           error: error,
    //           e: e,
    //         );
    //         await _response(emit);
    //       },
    //       update: (value) async {
    //         final (error, timeOut, e, res) = await _runGoSData<CategoriesExpensesModels>(
    //           function: () async =>
    //           await _categoriesRepository.update(uuid: value.uuid, data: value.data),
    //         );
    //         modelData = modelData.copyWithData(
    //           data: res,
    //           timeOut: timeOut,
    //           error: error,
    //           e: e,
    //         );
    //         await _response(emit);
    //       },
    //       check: (value) async {
    //         final (error, timeOut, e, res) = await _runGoSData<bool>(
    //           function: () async =>
    //           await _categoriesRepository.check(uuid: value.uuid, data: value.data),
    //         );
    //         if (error){
    //           Logger.print('Error check.:$timeOut:$e', name: 'err', error: true);
    //           value.completer.completeError(error);
    //         } else {
    //           value.completer.complete(res);
    //         }
    //       }
       );
    });
  }

  Future<void> _response(Emitter<MonthlyExpensesBlocState> emit) async {
    if (modelData.error){
      if(modelData.timeOut){
        emit(const MonthlyExpensesBlocState.timeOut());
      } else {
        emit(const MonthlyExpensesBlocState.error());
      }
    } else{
      final data = modelData.data;
      if (data != null) {
        emit(MonthlyExpensesBlocState.loaded(entity: data,));
      } else {
        Logger.print('Data not loaded.', name: 'err', error: true);
        emit(const MonthlyExpensesBlocState.error());
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
