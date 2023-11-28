
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/dialogs.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:provider/provider.dart';

class MainTabWidget extends StatelessWidget {
  const MainTabWidget({
    required this.statusUserProp,
    required this.categories,
    super.key
  });

  final StatusUserProp statusUserProp;
  final CategoriesExpensesEntity categories;

  @override
  Widget build(BuildContext context) {
    final monthlyExpensesBloc = context.read<MonthlyExpensesBloc>();
    final idMonth = statusUserProp.monthCurrent.id;
    final completer = Completer<MonthlyExpensesEntity>();
    if (idMonth != null) {
      monthlyExpensesBloc.add(MonthlyExpensesBlocEvent.readWithMonth(
        uuid: statusUserProp.uuid,
        idMonth: idMonth,
        completer: completer,
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder<MonthlyExpensesEntity>(
        future:  completer.future,
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  S.of(context).thereAreNoExpensesForMonthName(
                      NameMonth(context).toNameMonth(
                          statusUserProp.monthCurrent.month))
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return Hero(tag: Keys.heroIdSplash,
            child: CustomPieChart(
              statusUserProp: statusUserProp,
              categoriesExpensesModels: categories,
              data: completeExpensesForPieChart(snapshot.data),
            ),
          );
        },
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12.5),
            itemCount: categories.categoriesId.length,
            itemBuilder: (_, index) {
              const date = 1;
              final month= statusUserProp.monthCurrent.month;
              final year = statusUserProp.monthCurrent.year;
              final stringSelectedDateTime = '$year'
                  '-${month<10?'0$month':month}'
                  '-${date<10?'0$date':date}'
                  ' 00:00:00.000000';
              final categoryExpenses = categories.categoriesId.elementAt(index);
              return AddDayExpense(
                typeWidget: 0,
                statusUserProp: statusUserProp,
                categoryExpenses: categoryExpenses,
                child: CustomCard<BigInt>(
                  dayExpense: BigInt.from(0),
                  statusUserProp: statusUserProp,
                  categoryExpenses: categoryExpenses,
                  dateTime: DateTime.tryParse(stringSelectedDateTime),
                  deleteCard:(context)=>_deleteCategory(context,categoryExpenses),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Map<int, double> completeExpensesForPieChart(MonthlyExpensesEntity? data) {
    final completeExpenses = <DayExpense>{};
     if (data != null) {
      completeExpenses
        ..clear()
        ..addAll(data.completeExpenses);
    }
    final total = completeExpenses.fold(
        BigInt.zero, (previousValue, element) => previousValue +
        element.sum);
    final totalCategoriesPercent = <int, double>{};
    final categoriesId = categories.categoriesId;
    for (final value in categoriesId) {
      final idCategory = value.id;
      if (idCategory != null) {
        totalCategoriesPercent[idCategory] = 0;
        if(total != BigInt.zero) {
          var val = BigInt.zero;
          for (final elem in completeExpenses) {
            final id = elem.idCategory;
            if (id == idCategory) {
              val += elem.sum;
            }
          }
          totalCategoriesPercent[idCategory] = 100 * (val / total);
        } else{
          totalCategoriesPercent[idCategory] = 100/categoriesId.length;
        }
      } else {
        throw Exception('Error id Category');
      }
    }
    return totalCategoriesPercent;
  }

  Future<bool> _deleteCategory(
      BuildContext context,
      CategoryExpenses categoryExpenses
  ) async {
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
          uuid: statusUserProp.uuid,
          id: id));
      monthlyExpensesBloc.add(MonthlyExpensesBlocEvent.deleteWithCategory(
          uuid: statusUserProp.uuid,
          idCategory: id
      ));
      return true;
    }
    return false;
  }

}
