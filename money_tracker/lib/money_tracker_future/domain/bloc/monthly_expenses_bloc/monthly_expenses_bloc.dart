import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
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
        init: (value) async {
          emit(const MonthlyExpensesBlocState.loading());
          final (error, timeOut, e, res) = await _runGoSData<MonthlyExpensesEntity>(
            function: () async =>
            _monthlyExpensesRepository.getAllByIdMonthCategory(
                uuid: value.uuid,
                idCategory: value.idCategory,
                idMonth: value.idMonth,
            ),
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
          final (error, timeOut, e, res) = await _runGoSData<MonthlyExpensesEntity>(
            function: () async =>
            _monthlyExpensesRepository.getAllByIdMonthCategory(
              uuid: value.uuid,
              idCategory: value.idCategory,
              idMonth: value.idMonth,
            ),
          );
          modelData = modelData.copyWithData(
            data: res,
            timeOut: timeOut,
            error: error,
            e: e,
          );
          final completer = value.completer;
          if (completer != null){
            if (error){
              Logger.print('Error read monthly expenses.:$timeOut:$e', name: 'err', error: true);
              completer.completeError(error);
            } else {
              completer.complete(res);
            }
          } else {
            await _response(emit);
          }
        },
        readTotal: (value) async {
          final (error, timeOut, e, res) = await _runGoSData<BigInt>(
            function: () async =>
            _monthlyExpensesRepository.getTotalInMonthCategory(
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
            Logger.print('Error readTotal monthly expenses.:$timeOut:$e', name: 'err', error: true);
            value.completer.completeError(error);
          } else {
            value.completer.complete(res);
          }
        },
        add: (value) async {
          final (error, timeOut, e, res) = await _runGoSData<int>(
            function: () async =>
              _monthlyExpensesRepository.insert(
                  uuid: value.uuid,
                  data: value.data
              ),
          );
          modelData = modelData.copyWithData(
            data: null,
            timeOut: timeOut,
            error: error,
            e: e,
          );
          if (error){
            Logger.print('Error add monthly expenses.:$timeOut:$e', name: 'err', error: true);
            value.completer.completeError(error);
          } else {
            value.completer.complete(res);
          }
        },
        deleteWithCategory: (value) async {
          final (error, timeOut, e, res) = await _runGoSData<bool>(
            function: () async =>
            _monthlyExpensesRepository.deleteWithCategory(uuid: value.uuid, idCategory: value.idCategory),
          );
          modelData = modelData.copyWithData(
            data: null,
            timeOut: timeOut,
            error: (res!=null && !res) || error || res==null,
            e: e,
          );
          await _response(emit);
        },
        delete: (value) async {
          emit(const MonthlyExpensesBlocState.loading());
          final (error, timeOut, e, res) = await _runGoSData<bool>(
            function: () async =>
            _monthlyExpensesRepository.delete(uuid: value.uuid),
          );
          modelData = modelData.copyWithData(
            data: (res!=null && res)?const MonthlyExpensesEntity(
                completeExpenses: <DayExpense>{}
            ):null,
            timeOut: timeOut,
            error: error,
            e: e,
          );
          await _response(emit);
        },
        deleteId: (value) async {
          final (error, timeOut, e, res) = await _runGoSData<bool>(
            function: () async =>
            _monthlyExpensesRepository.deleteId(uuid: value.uuid, id: value.id),
          );
          modelData = modelData.copyWithData(
            data: null,
            timeOut: timeOut,
            error: error || (res != null && !res) || (res == null),
            e: e,
          );
          await _response(emit);
        },
        readWithMonth: (value) async {
          final (error, timeOut, e, res) = await _runGoSData<MonthlyExpensesEntity>(
            function: () async =>
            _monthlyExpensesRepository.readWithMonth(
                uuid: value.uuid,
                idMonth: value.idMonth),
          );
          modelData = modelData.copyWithData(
            data: res,
            timeOut: timeOut,
            error: error,
            e: e,
          );
          if (error){
            Logger.print('Error readWithMonth monthly expenses.:$timeOut:$e', name: 'err', error: true);
            value.completer.completeError(error);
          } else {
            value.completer.complete(res);
          }
        },
        update: (value) async {
          final (error, timeOut, e, res) = await _runGoSData<bool>(
            function: () async =>
                _monthlyExpensesRepository.update(
                    uuid: value.uuid,
                    data: value.data
                ),
          );
          modelData = modelData.copyWithData(
            data: null,
            timeOut: timeOut,
            error: error,
            e: e,
          );
          if (error){
            Logger.print('Error update monthly expenses.:$timeOut:$e', name: 'err', error: true);
            value.completer.completeError(error);
          } else {
            value.completer.complete(res);
          }
          // await _response(emit);
        },
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
