
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/dialogs.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:provider/provider.dart';

enum TypeWidget {
  fromMainTabAdd,
  fromCardModify,
  fromHomeDetailAdd,
}

class AddEditDayExpense extends StatelessWidget {
  const AddEditDayExpense({
    required this.child,
    required this.statusUserProp,
    required this.categoryExpenses,
    required this.typeWidget,
    this.idDayExpense,
    this.update,
    this.updateMainTab,
    super.key,
  });

  final CategoryExpenses categoryExpenses;
  final StatusUserProp statusUserProp;
  final TypeWidget typeWidget;
  final int? idDayExpense;
  final Widget child;
  final Future<void> Function(DayExpense? data)? update;
  final Future<void> Function(BigInt total, int icCategory, {bool? addData})? updateMainTab;

  @override
  Widget build(BuildContext context) {
    return typeWidget==TypeWidget.fromMainTabAdd?GestureDetector(
       onTap: () => _addDayExpense(context),
       child: child,
    ): IconButton(
        onPressed: () => _addDayExpense(context),
        icon: child
    );
  }

  Future<void> _addDayExpense(BuildContext context) async {
    final monthBloc = context.read<MonthBloc>();
    final monthlyExpensesBloc = context.read<MonthlyExpensesBloc>();
    final categoriesBloc = context.read<CategoriesBloc>();
    final id = categoryExpenses.id;

    final locStat = statusUserProp;
    final stringDateTime =  '${locStat.monthCurrent.year}'
        '-${      locStat.monthCurrent.month<10
        ?'0${locStat.monthCurrent.month}'
        :'${locStat.monthCurrent.month}'}'
        '-01 00:00:00.000000';
    final dateTime = DateTime.tryParse(stringDateTime);
    if(dateTime == null) return;
    if(id == null) return;
    final res = await showDialog<(BigInt, DateTime)>(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.only(left: 25, right: 25),
        child: DayExpenseWidget(
          id: id,
          dateTimeStart: dateTime,
          typeWidget: typeWidget,
        ),
      ),
    );

    final idMonth = statusUserProp.monthCurrent.id;
    final idCategory = categoryExpenses.id;

    if(idMonth!=null && idCategory!=null && res!=null) {

      final resDateTime = res.$2;

      var otherMonth = false;
      int? idMonthOther;

      if(!(resDateTime.year == dateTime.year &&
          resDateTime.month == dateTime.month
      )){
        otherMonth = true;
        final completer = Completer<int>();
        monthBloc.add(MonthBlocEvent.add(
            uuid: statusUserProp.uuid,
            data: MonthCurrent(
              id: null,
              year: resDateTime.year,
              month: resDateTime.month,
            ),
            completer: completer
        ));
        idMonthOther = await completer.future;
      }

      if(typeWidget==TypeWidget.fromCardModify){
        final completer = Completer();
        final data = DayExpense(
          id: idDayExpense,
          idMonth: otherMonth?(idMonthOther??idMonth):idMonth,
          idCategory: idCategory,
          dateTime: resDateTime,
          sum: res.$1,
        );
        monthlyExpensesBloc.add(MonthlyExpensesBlocEvent.update(
            uuid: statusUserProp.uuid,
            data: data,
            completer: completer
        ));
        await completer.future;
        await update?.call(data);
      } else {
        final completer = Completer<int>();
        final data = DayExpense(
          idMonth: otherMonth?(idMonthOther??idMonth):idMonth,
          idCategory: idCategory,
          dateTime: resDateTime,
          sum: res.$1,
        );
        monthlyExpensesBloc.add(MonthlyExpensesBlocEvent.add(
            uuid: statusUserProp.uuid,
            data: data,
            completer: completer
        ));
        final id = await completer.future;
        await update?.call(data.copyWith(
          id: id
        ));
        await updateMainTab?.call(
          data.sum,
          idCategory,
          addData: true
        );
      }



      // monthlyExpensesBloc.add(typeWidget==TypeWidget.fromCardModify?MonthlyExpensesBlocEvent.update(
      //     uuid: statusUserProp.uuid,
      //     data: DayExpense(
      //       id: idDayExpense,
      //       idMonth: otherMonth?(idMonthOther??idMonth):idMonth,
      //       idCategory: idCategory,
      //       dateTime: resDateTime,
      //       sum: res.$1,
      //     ),
      //     completer: completer
      // ):MonthlyExpensesBlocEvent.add(
      //     uuid: statusUserProp.uuid,
      //     data: DayExpense(
      //       idMonth: otherMonth?(idMonthOther??idMonth):idMonth,
      //       idCategory: idCategory,
      //       dateTime: resDateTime,
      //       sum: res.$1,
      //     ),
      //     completer: completer
      //   ),
      // );
      //await completer.future;

    }
  }
}
