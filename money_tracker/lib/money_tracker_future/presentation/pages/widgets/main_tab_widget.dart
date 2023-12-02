
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
  final _valueNotifierNeedsToBeUpdatedList  = ValueNotifier<bool>(false);
  Map<int, BigInt>? _localTotalCategories;

  @override
  void dispose() {
    super.dispose();
    _valueNotifierNeedsToBeUpdatedList.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final monthlyExpensesBloc = context.read<MonthlyExpensesBloc>();
    final idMonth = widget.statusUserProp.monthCurrent.id;
    final theme = Theme.of(context);


    Future.delayed(Duration.zero, () async {
      final completer = Completer<Map<int, BigInt>>();
      if (idMonth != null) {
        monthlyExpensesBloc.add(MonthlyExpensesBlocEvent.readWithMonth(
          uuid: widget.statusUserProp.uuid,
          idMonth: idMonth,
          completer: completer,
        ));
      }
      _localTotalCategories = await completer.future;
      _valueNotifierNeedsToBeUpdatedList.value = 
        !_valueNotifierNeedsToBeUpdatedList.value;
    },);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: _valueNotifierNeedsToBeUpdatedList,
            builder: (_, __, ___) => _localTotalCategories==null?Container(
              color: theme.colorScheme.secondary,
              height: 240,
              width: double.maxFinite,
              padding: const EdgeInsets.all(30),
              child: const Center(child: CircularProgressIndicator()),
            ) : CustomPieChart(
              statusUserProp: widget.statusUserProp,
              categoriesExpensesModels: widget.categories,
              data: _localTotalCategories??<int, BigInt>{},
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _valueNotifierNeedsToBeUpdatedList,
            builder: (_, __, ___) => Expanded(
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
                  Logger.print('rebuild $index');
                  return AddEditDayExpense(
                      typeWidget: TypeWidget.fromMainTabAdd,
                      statusUserProp: widget.statusUserProp,
                      categoryExpenses: categoryExpenses,
                      updateMainTab: _updateMainTab,
                      child: CustomCard<BigInt>(
                        statusUserProp: widget.statusUserProp,
                        dayExpense: BigInt.zero,
                        categoryExpenses: categoryExpenses,
                        dateTime: DateTime.tryParse(stringSelectedDateTime),
                        deleteCard:(context)=>_deleteCategory(context,categoryExpenses),
                        updateMainTab: _updateMainTab,
                      ),
                  );
                },
              ),
            ),
          ),
        ],
    );
  }

  Future<void> _updateMainTab(BigInt total, int idCategory, {bool? addData}) async {

    if(addData != null && addData){
      final data = _localTotalCategories?[idCategory];
      if (data != null){
        _localTotalCategories?[idCategory] = data + total;
        _valueNotifierNeedsToBeUpdatedList.value =
        !_valueNotifierNeedsToBeUpdatedList.value;
      }
      return;
    }

    _localTotalCategories?.remove(idCategory);
    _localTotalCategories?.putIfAbsent(idCategory, () => total);
    _valueNotifierNeedsToBeUpdatedList.value =
      !_valueNotifierNeedsToBeUpdatedList.value;

  }

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
