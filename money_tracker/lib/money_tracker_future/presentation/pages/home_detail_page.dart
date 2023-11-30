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

class HomeDetailPage extends StatefulWidget {
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
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {

  int needsToBeUpdated = 0;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  final valueNotifierNeedsToBeUpdatedList  = ValueNotifier<bool>(false);


  @override
  void dispose() {
    valueNotifierNeedsToBeUpdatedList.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final idMonth = widget.statusUserProp.monthCurrent.id;
    final theme = Theme.of(context);
    final idCategory = widget.categoryExpenses.id;

    if (idMonth != null && idCategory != null) {
      context.read<MonthlyExpensesBloc>()
        .add(MonthlyExpensesBlocEvent.init(
          uuid: widget.statusUserProp.uuid,
          idMonth: idMonth,
          idCategory: idCategory,
        ));
    }
    final categoryExpensesColor = Color(
        int.parse('FF${widget.categoryExpenses.colorHex}', radix: 16)
    );
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: theme.appBarTheme.systemOverlayStyle?.copyWith(
            statusBarColor: categoryExpensesColor,
          ),
          backgroundColor: categoryExpensesColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: PopScope(
              onPopInvoked: (didPop) {
                if (didPop) return;
                gotoPop(context);
              },
              child: IconButton(
                onPressed: () {
                  gotoPop(context);
                },
                icon: const ContainerIconShadow(
                  icon: Icons.arrow_back_ios,
                ),
              ),
            ),
          ),
          title: Hero(tag: '${Keys.heroIdSplash}${idCategory??''}',
              //StackTextTwice
              child: StackTextTwice(
                  text: widget.categoryExpenses.name,
                  color: categoryExpensesColor,
              ),
          ),

          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: AddDayExpense(
                  typeWidget: 1,
                  statusUserProp: widget.statusUserProp,
                  categoryExpenses: widget.categoryExpenses,
                  child: const ContainerIconShadow(
                      icon: Icons.add
              )),
            ),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<MonthlyExpensesBloc, MonthlyExpensesBlocState>(
            builder: (context, state) {
              return state.map(
                  loading: (_) {
                    return const CircularProgressIndicatorMod();
                  },
                  loaded: (value) {
                    needsToBeUpdated++;
                    var localCompleteExpenses = value.entity?.completeExpenses;
                      return RefreshIndicator(
                        key: _refreshIndicatorKey,
                        onRefresh: () async {
                          final completer = Completer<MonthlyExpensesEntity>();
                          if (idMonth != null && idCategory != null) {
                            context.read<MonthlyExpensesBloc>()
                                .add(MonthlyExpensesBlocEvent.read(
                              uuid: widget.statusUserProp.uuid,
                              idMonth: idMonth,
                              idCategory: idCategory,
                              completer: completer,
                            ));
                            localCompleteExpenses = (await completer.future).completeExpenses;
                            needsToBeUpdated++;
                            valueNotifierNeedsToBeUpdatedList.value = !valueNotifierNeedsToBeUpdatedList.value;
                          }
                        },
                        child: ValueListenableBuilder<bool>(
                            valueListenable: valueNotifierNeedsToBeUpdatedList,
                            builder: (_, value, __) => ListView.builder(
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
                                  statusUserProp: widget.statusUserProp,
                                  categoryExpenses: widget.categoryExpenses,
                                  deleteCard: (context) => _deleteDayExpense(context, dayExpense),
                                ),
                              );
                            }),
                        ),
                      );
                  },
                  error: (_) => ErrorTimeOut<MonthlyExpensesBloc, CategoriesExpensesEntity?>(
                    uuid: widget.statusUserProp.uuid,
                    idMonth: idMonth,
                    idCategory: idCategory,
                  ),
                  timeOut: (_) => ErrorTimeOut<MonthlyExpensesBloc, CategoriesExpensesEntity?>(
                    uuid: widget.statusUserProp.uuid,
                    idMonth: idMonth,
                    idCategory: idCategory,
                  ),);
            },
          ),
        ),
    );

  }

  void gotoPop(BuildContext context) {
    if(needsToBeUpdated <=1) {
      Navigator.of(context, rootNavigator: true).pop();
    } else {
      Navigator.of(context).pushReplacementNamed(
        MainFormMoneyTracker.routeName,
        arguments: {
          'uuid': widget.statusUserProp.uuid,
          'eMail': widget.statusUserProp.eMail,
          'loadImage': widget.statusUserProp.loadImage,
          'dateTime': widget.dateTime,
        },
      );
    }
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
      final idMonth = widget.statusUserProp.monthCurrent.id;
      final idCategory = widget.categoryExpenses.id;
      if (id != null && idMonth != null && idCategory != null) {
        monthlyExpensesBloc..add(MonthlyExpensesBlocEvent.deleteId(
            uuid: widget.statusUserProp.uuid,
            id: id))
          ..add(MonthlyExpensesBlocEvent.read(
            uuid: widget.statusUserProp.uuid,
            idMonth: idMonth,
            idCategory: idCategory,
          ));
        needsToBeUpdated++;
        return true;
      }
    }
    return false;
  }
}
