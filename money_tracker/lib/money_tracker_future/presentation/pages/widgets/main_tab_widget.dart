
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/dialogs.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:provider/provider.dart';

class MainTabWidget extends StatefulWidget {
  const MainTabWidget({
    required this.statusUserProp,
    required this.categories,
    super.key
  });

  final StatusUserProp statusUserProp;
  final CategoriesExpensesEntity categories;

  @override
  State<MainTabWidget> createState() => _MainTabWidgetState();
}

class _MainTabWidgetState extends State<MainTabWidget> {

  MonthlyExpensesEntity? monthlyExpensesEntity;

  @override
  Widget build(BuildContext context) {
    final valueNotifierNeedsToBeUpdatedList  = ValueNotifier<bool>(false);
    final monthlyExpensesBloc = context.read<MonthlyExpensesBloc>();
    final idMonth = widget.statusUserProp.monthCurrent.id;
    final theme = Theme.of(context);


    Future.delayed(Duration.zero, () async {
      final completer = Completer<MonthlyExpensesEntity>();
      if (idMonth != null) {
        monthlyExpensesBloc.add(MonthlyExpensesBlocEvent.readWithMonth(
          uuid: widget.statusUserProp.uuid,
          idMonth: idMonth,
          completer: completer,
        ));
      }
      monthlyExpensesEntity = await completer.future;
      valueNotifierNeedsToBeUpdatedList.value = !valueNotifierNeedsToBeUpdatedList.value;
    },);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: valueNotifierNeedsToBeUpdatedList,
            builder: (_, __, ___) => monthlyExpensesEntity==null?Container(
              color: theme.colorScheme.secondary,
              height: 240,
              width: double.maxFinite,
              padding: const EdgeInsets.all(30),
              child: const Center(child: CircularProgressIndicator()),
            ) : CustomPieChart(
              statusUserProp: widget.statusUserProp,
              categoriesExpensesModels: widget.categories,
              data: _completeExpensesForPieChart(monthlyExpensesEntity),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12.5),
              itemCount: widget.categories.categoriesId.length,
              itemBuilder: (_, index) {
                const date = 1;
                final month= widget.statusUserProp.monthCurrent.month;
                final year = widget.statusUserProp.monthCurrent.year;
                final stringSelectedDateTime = '$year'
                    '-${month<10?'0$month':month}'
                    '-${date<10?'0$date':date}'
                    ' 00:00:00.000000';
                final categoryExpenses = widget.categories.categoriesId.elementAt(index);
                return AddEditDayExpense(
                  typeWidget: TypeWidget.fromMainTabAdd,
                  statusUserProp: widget.statusUserProp,
                  categoryExpenses: categoryExpenses,
                  child: CustomCard<BigInt>(
                    statusUserProp: widget.statusUserProp,
                    dayExpense: BigInt.zero,
                    categoryExpenses: categoryExpenses,
                    dateTime: DateTime.tryParse(stringSelectedDateTime),
                    deleteCard:(context)=>_deleteCategory(context,categoryExpenses),
                    //update: () => updateCustomPieChart(monthlyExpensesBloc: monthlyExpensesBloc),
                  ),
                );
              },
            ),
          ),
        ],
    );
  }

  // Future<void> updateCustomPieChart({
  //   required MonthlyExpensesBloc monthlyExpensesBloc
  // }) async {
  //
  //   final completer = Completer<MonthlyExpensesEntity>();
  //   final idMonth = widget.statusUserProp.monthCurrent.id;
  //   if (idMonth != null) {
  //     monthlyExpensesBloc.add(MonthlyExpensesBlocEvent.readWithMonth(
  //       uuid: widget.statusUserProp.uuid,
  //       idMonth: idMonth,
  //       completer: completer,
  //     ));
  //   }
  //   monthlyExpensesEntity = await completer.future;
  // }

  (Map<int, (double, String)>, BigInt) _completeExpensesForPieChart(MonthlyExpensesEntity? data) {

    final completeExpenses = <DayExpense>{};
     if (data != null) {
      completeExpenses
        ..clear()
        ..addAll(data.completeExpenses);
    }
    final total = completeExpenses.fold(
        BigInt.zero, (previousValue, element) => previousValue +
        _abs(element.sum)
    );
    final totalCategoriesPercent = <int, (double, String)>{};
    final categoriesId = widget.categories.categoriesId;
    for (final value in categoriesId) {
      final idCategory = value.id;
      if (idCategory != null) {
          var val = BigInt.zero;
          for (final elem in completeExpenses) {
            final id = elem.idCategory;
            if (id == idCategory) {
              val += elem.sum;
            }
          }
          totalCategoriesPercent[idCategory] = (_abs(val).toDouble(), val<BigInt.zero?'-':'');

      } else {
        throw Exception('Error id Category');
      }
    }
    Logger.print('ChartData:$totalCategoriesPercent:$total');
    return (totalCategoriesPercent, total);
  }

  BigInt _abs(BigInt val) => val<BigInt.zero?-val:val;

  Future<bool> _deleteCategory(BuildContext context,
      CategoryExpenses categoryExpenses ) async {
    final categoriesBloc = context.read<CategoriesBloc>();
    final monthlyExpensesBloc = context.read<MonthlyExpensesBloc>();
    final res = await showDialog<bool>(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.only(left: 25, right: 25),
        child: DeleteDialog(
          description: S.of(context).removeCategory,
          name: categoryExpenses.name,
        ),
      ),
    );
    final id = categoryExpenses.id;
    if (res != null && res && id !=null) {
      categoriesBloc.add(CategoriesBlocEvent.deleteId(
          uuid: widget.statusUserProp.uuid,
          id: id));
      monthlyExpensesBloc.add(MonthlyExpensesBlocEvent.deleteWithCategory(
          uuid: widget.statusUserProp.uuid,
          idCategory: id
      ));
      return true;
    }
    return false;
  }
}
