import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/dialogs.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:money_tracker/money_tracker_future/src.dart';

class HomeDetailPage extends StatelessWidget {
  static const routeName = r'\PageHomeDetailPage';

  const HomeDetailPage({
    required this.categoryExpenses,
    required this.statusUserProp,
    required this.dateTime,
    super.key});

  final StatusUserProp statusUserProp;
  final CategoryExpenses categoryExpenses;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    final idMonth = statusUserProp.monthCurrent.id;
    final idCategory = categoryExpenses.id;
    if (idMonth != null && idCategory != null) {
      context.read<MonthlyExpensesBloc>()
        .add(MonthlyExpensesBlocEvent.init(
          uuid: statusUserProp.uuid,
          idMonth: idMonth,
          idCategory: idCategory,
        ));
    }
    final categoryExpensesColor = Color(
        int.parse('FF${categoryExpenses.colorHex}', radix: 16)
    );
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                    MainFormMoneyTracker.routeName,
                    arguments: {
                      'uuid': statusUserProp.uuid,
                      'eMail': statusUserProp.eMail,
                      'loadImage': statusUserProp.loadImage,
                      'dateTime': dateTime,
                    },
                  );
                },
                icon: const StackContainerIconTwice(
                  icon: Icons.arrow_back_ios,
                ),
              ),
            ),
            title: Hero(tag: '${Keys.heroIdSplash}${idCategory??''}',
                //StackTextTwice
                child: StackTextTwice(
                    text: categoryExpenses.name,
                    color: categoryExpensesColor,
                ),
            ),
            backgroundColor: categoryExpensesColor,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: AddDayExpense(
                    typeWidget: 1,
                    statusUserProp: statusUserProp,
                    categoryExpenses: categoryExpenses,
                    child: const StackContainerIconTwice(
                        icon: Icons.add
                )),
              ),
            ],
          ),
          body: BlocBuilder<MonthlyExpensesBloc, MonthlyExpensesBlocState>(
            builder: (context, state) {
              return state.map(
                  loading: (_) {
                    return const CircularProgressIndicatorMod();
                  },
                  loaded: (value) {
                    var localCompleteExpenses = value.entity?.completeExpenses;

                      return RefreshIndicator(
                        onRefresh: () async {
                          final completer = Completer<MonthlyExpensesEntity>();
                          if (idMonth != null && idCategory != null) {
                            context.read<MonthlyExpensesBloc>()
                                .add(MonthlyExpensesBlocEvent.read(
                              uuid: statusUserProp.uuid,
                              idMonth: idMonth,
                              idCategory: idCategory,
                              completer: completer,
                            ));
                            localCompleteExpenses = (await completer.future).completeExpenses;
                          }

                        },
                        child: ListView.builder(
                          padding: const EdgeInsets.all(12.5),
                          itemCount: localCompleteExpenses?.length,
                          itemBuilder: (_, index) {
                            final data = localCompleteExpenses ??= <DayExpense>{};
                            final dayExpense = data.elementAt(index);
                            return Dismissible(
                              key: UniqueKey(),
                              confirmDismiss: (_) async {
                                  return _deleteDayExpense(context, dayExpense);
                              },
                              child: CustomCard<DayExpense>(
                                dayExpense:dayExpense,
                                statusUserProp: statusUserProp,
                                categoryExpenses: categoryExpenses,
                                deleteCard: (context) => _deleteDayExpense(context, dayExpense),
                              ),
                            );
                          }),
                      );
                  },
                  error: (_) => ErrorTimeOut<MonthlyExpensesBloc, CategoriesExpensesEntity?>(
                    uuid: statusUserProp.uuid,
                    idMonth: idMonth,
                    idCategory: idCategory,
                  ),
                  timeOut: (_) => ErrorTimeOut<MonthlyExpensesBloc, CategoriesExpensesEntity?>(
                    uuid: statusUserProp.uuid,
                    idMonth: idMonth,
                    idCategory: idCategory,
                  ),);
            },
          ),
      ),
    );

  }

  Future<bool> _deleteDayExpense(
      BuildContext context,
      DayExpense dayExpense
  ) async {
    final monthlyExpensesBloc = context.read<MonthlyExpensesBloc>();
    final res = await showDialog<bool>(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.only(left: 25, right: 25),
        child: DeleteDialog(description: S.of(context).deleteConsumptionData),
      ),
    );
    if (res != null && res) {
      final id = dayExpense.id;
      final idMonth = statusUserProp.monthCurrent.id;
      final idCategory = categoryExpenses.id;
      if (id != null && idMonth != null && idCategory != null) {
        monthlyExpensesBloc..add(MonthlyExpensesBlocEvent.deleteId(
            uuid: statusUserProp.uuid,
            id: id))
          ..add(MonthlyExpensesBlocEvent.read(
            uuid: statusUserProp.uuid,
            idMonth: idMonth,
            idCategory: idCategory,
          ));

        return true;
      }
    }
    return false;
  }

}
