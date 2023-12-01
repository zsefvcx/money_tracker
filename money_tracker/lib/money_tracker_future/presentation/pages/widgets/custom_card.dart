
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/dialogs.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';

class CustomCard<T> extends StatefulWidget {
  const CustomCard({
    required this.dayExpense,
    required this.statusUserProp,
    required this.categoryExpenses,
    required this.deleteCard,
    this.dateTime,
    this.update,
    this.updateMainTab,
    super.key
  });

  final StatusUserProp statusUserProp;
  final CategoryExpenses categoryExpenses;
  final T dayExpense;
  final DateTime? dateTime;
  final Future<bool> Function(BuildContext context) deleteCard;
  final Future<void> Function(DayExpense? data)? update;
  final Future<void> Function()? updateMainTab;

  @override
  State<CustomCard<T>> createState() => _CustomCardState<T>();
}

class _CustomCardState<T> extends State<CustomCard<T>> {

  final valueNotifierDayExpense = ValueNotifier<BigInt>(BigInt.zero);
  final valueNotifierLongPress  = ValueNotifier<bool>(false);
  final valueNotifierPencilVisible  = ValueNotifier<bool>(false);

  @override
  void initState() {
    final dayExpense = widget.dayExpense;
    if(dayExpense is BigInt) {
      _updateCard(null);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    valueNotifierDayExpense.dispose();
    valueNotifierLongPress.dispose();
    valueNotifierPencilVisible.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dayExpense = widget.dayExpense;
    final description = (dayExpense is BigInt)
        ?widget.categoryExpenses.name
        :(dayExpense is DayExpense)
        ?dayExpense.sum.toString()
        :S.of(context).notImplemented;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onExit: (event) {
        valueNotifierLongPress.value = false;
        valueNotifierPencilVisible.value = false;
      },
      child: GestureDetector(
        onDoubleTap: () {
          valueNotifierPencilVisible.value = !valueNotifierPencilVisible.value;
          if (valueNotifierPencilVisible.value) _delayedFutureValueNotifier(context, second: 5);
        },
        onLongPress: () {
          valueNotifierLongPress.value = !valueNotifierLongPress.value;
          if(valueNotifierLongPress.value)_delayedFutureValueNotifier(context, second: 5);
        },
        onSecondaryLongPress: () async {
          await widget.deleteCard(context);
          valueNotifierLongPress.value = false;
          valueNotifierPencilVisible.value = false;
        },
        child: Card(
          child: Container(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      13.h,
                      Text(
                        description,
                        style: theme.textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      9.h,
                      if(dayExpense is BigInt)ValueListenableBuilder(
                          valueListenable: valueNotifierDayExpense,
                          builder: (_, value, __) {
                            return  Text(S.of(context).totalDayexpense(value),
                              style:  theme.textTheme.bodySmall,
                            );
                          },
                      ),
                      if(dayExpense is DayExpense)Text(
                        '${dayExpense.dateTime.year} '
                        '${NameMonth(context).toNameMonth(dayExpense.dateTime.month)} '
                        '${dayExpense.dateTime.day<10?'0${dayExpense.dateTime.day}':dayExpense.dateTime.day} / '
                        '${dayExpense.dateTime.hour<10?'0${dayExpense.dateTime.hour}':dayExpense.dateTime.hour}:'
                        '${dayExpense.dateTime.minute<10?'0${dayExpense.dateTime.minute}':dayExpense.dateTime.minute}',
                        style:  theme.textTheme.bodySmall,
                      ),
                      20.h,
                    ],
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: valueNotifierLongPress,
                  builder: (_, value, __) {
                  if (!value) {
                    return Row(
                      children: [
                        ValueListenableBuilder<bool>(
                          valueListenable: valueNotifierPencilVisible,
                          builder: (context, value, __) => Visibility(
                            visible: value,
                            child: (dayExpense is BigInt)?AddEditCategory(
                              contextMacro: context,
                              statusUserProp: widget.statusUserProp,
                              categoryExpenses: widget.categoryExpenses,
                              icon: const ContainerIconShadow(
                                  icon: Icons.edit
                              ),
                              addCategory: false,
                            ):(dayExpense is DayExpense)?Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: AddEditDayExpense(
                                  typeWidget: TypeWidget.fromCardModify,
                                  idDayExpense: dayExpense.id,
                                  statusUserProp: widget.statusUserProp,
                                  categoryExpenses: widget.categoryExpenses,
                                  child: const ContainerIconShadow(
                                      icon: Icons.edit
                                  ),
                                  update: widget.update,
                              ),
                            ):Text(S.of(context).notImplemented),
                          ),
                        ),
                        Visibility(
                          visible: dayExpense is BigInt,
                          child: IconButton(
                            onPressed: () {//pushReplacementNamed
                              Navigator.of(context).pushNamed(HomeDetailPage.routeName,
                                arguments: {
                                  'statusUserProp': widget.statusUserProp,
                                  'categoryExpenses': widget.categoryExpenses,
                                  'dateTime': widget.dateTime,
                                  'updateCard': _updateCard,
                                  'total': valueNotifierDayExpense.value,
                                },
                              );
                            },
                            icon: Hero(tag: '${Keys.heroIdSplash}${widget.categoryExpenses.id??''}',
                              child: ContainerIconShadow(
                                icon: Icons.arrow_forward_ios,
                                color: Color(int.parse('FF${widget.categoryExpenses.colorHex}', radix: 16)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return ElevatedButton(onPressed: () async {
                      await widget.deleteCard(context);
                      valueNotifierLongPress.value = false;
                      valueNotifierPencilVisible.value = false;
                    },
                      child: Text(S.of(context).delete,
                        style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.background
                        ),
                      ),
                      style: theme.elevatedButtonTheme.style?.copyWith(
                        surfaceTintColor: MaterialStatePropertyAll(
                            theme.colorScheme.inversePrimary),
                        backgroundColor: MaterialStatePropertyAll(
                            theme.colorScheme.inversePrimary),
                        shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        )),
                        minimumSize: const MaterialStatePropertyAll(Size(80, double.maxFinite)),
                        maximumSize: const MaterialStatePropertyAll(Size(80, double.maxFinite)),
                        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                      ),
                    );
                  }
                }),
              ],
            ),
          ) ,
        ),
      ),
    );
  }

  Future<void> _updateCard(BigInt? data) async {
    if(data != null){
      valueNotifierDayExpense.value = data;
      await widget.updateMainTab?.call();
      return;
    }
    final monthlyExpensesBloc = context.read<MonthlyExpensesBloc>();
    final idMonth = widget.statusUserProp.monthCurrent.id;
    final idCategory = widget.categoryExpenses.id;
    if (idMonth != null && idCategory != null) {
      final completer = Completer<BigInt>();
      monthlyExpensesBloc.add(MonthlyExpensesBlocEvent.readTotal(
        uuid: widget.statusUserProp.uuid,
        idMonth: idMonth,
        idCategory: idCategory,
        completer: completer,
      ));
      final res = await completer.future;
      valueNotifierDayExpense.value = res;
    }
    await widget.updateMainTab?.call();
  }

  void _delayedFutureValueNotifier(BuildContext context, {required int second}) =>
    Future.delayed(Duration(seconds: second), () {
      if(!context.mounted) return;
      valueNotifierLongPress.value = false;
      valueNotifierPencilVisible.value = false;
    },);
}
