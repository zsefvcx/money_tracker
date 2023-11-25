
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/dialogs.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:provider/provider.dart';

class CustomCard<T> extends StatefulWidget {
  const CustomCard({
    required this.dayExpense,
    required this.statusUserProp,
    required this.categoryExpenses,
    super.key
  });

  final StatusUserProp statusUserProp;
  final CategoryExpenses categoryExpenses;
  final T dayExpense;


  @override
  State<CustomCard<T>> createState() => _CustomCardState<T>();
}

class _CustomCardState<T> extends State<CustomCard<T>> {

  final valueNotifierDayExpense  = ValueNotifier<BigInt>(BigInt.from(0));
  final valueNotifierLongPress  = ValueNotifier<bool>(false);
  final valueNotifierPencilVisible  = ValueNotifier<bool>(false);

  @override
  void initState() {
    final dayExpense = widget.dayExpense;
    if(dayExpense is BigInt) {
      valueNotifierDayExpense.value = dayExpense;
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

  Future<bool> _deleteCategory(BuildContext context) async {
    final categoriesBloc = context.read<CategoriesBloc>();
    final monthlyExpensesBloc = context.read<MonthlyExpensesBloc>();
    final res = await showDialog<bool>(
            context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.only(left: 25, right: 25),
        child: DeleteDialog(
          description: S.of(context).removeCategory,
          name: widget.categoryExpenses.name,
        ),
      ),
    );
    final id = widget.categoryExpenses.id;
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

  Future<void> _addDayExpense(BuildContext context) async {
    final monthBloc = context.read<MonthBloc>();
    final monthlyExpensesBloc = context.read<MonthlyExpensesBloc>();
    final categoriesBloc = context.read<CategoriesBloc>();
    final id = widget.categoryExpenses.id;

    final locStat = widget.statusUserProp;
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
        child: AddDayExpense(id: id, dateTimeStart: dateTime),
      ),
    );

    final idMonth = widget.statusUserProp.monthCurrent.id;
    final idCategory = widget.categoryExpenses.id;

    if(idMonth!=null && idCategory!=null && res!=null) {

      final resDateTime = res.$2;

      var otherMonth = false;
      int? idMonthOther;

      if(resDateTime.year == dateTime.year &&
         resDateTime.month == dateTime.month
      ){
        final total = valueNotifierDayExpense.value;
        valueNotifierDayExpense.value = total + res.$1;
      } else {
        otherMonth = true;
        final completer = Completer<int>();
        monthBloc.add(MonthBlocEvent.add(
          uuid: widget.statusUserProp.uuid,
          data: MonthCurrent(
            id: null,
            year: resDateTime.year,
            month: resDateTime.month,
          ),
          completer: completer
        ));
        idMonthOther = await completer.future;
      }

      final completer = Completer();
      monthlyExpensesBloc.add(MonthlyExpensesBlocEvent.add(
          uuid: widget.statusUserProp.uuid,
          data: DayExpense(
            idMonth: otherMonth?(idMonthOther??idMonth):idMonth,
            idCategory: idCategory,
            dateTime: resDateTime,
            sum: res.$1,
          ),
          completer: completer
      ));
      await completer.future;
      if(!otherMonth) {
          categoriesBloc.add(CategoriesBlocEvent.init(uuid: widget.statusUserProp.uuid));
      }
    }
  }

  Future<bool> _deleteDayExpense(BuildContext context) async {
    final monthlyExpensesBloc = context.read<MonthlyExpensesBloc>();
    final res = await showDialog<bool>(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.only(left: 25, right: 25),
        child: DeleteDialog(description: S.of(context).deleteConsumptionData),
      ),
    );
    final dayExpense = widget.dayExpense;
    if (res != null && res && dayExpense is DayExpense) {
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
        return true;
      }
    }
    return false;
  }

  Future<bool> _delete(BuildContext context) async {
    final dayExpense = widget.dayExpense;
    if(dayExpense is BigInt ){
      return _deleteCategory(context);
    }
    if(dayExpense is DayExpense){
      return _deleteDayExpense(context);
    }
    return false;
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

    if(dayExpense is BigInt) {
      Future.delayed(Duration.zero, () async {
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
      },);
    }

    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (_) => _delete(context),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onExit: (event) {
          valueNotifierLongPress.value = false;
          valueNotifierPencilVisible.value = false;
        },
        child: GestureDetector(
          onDoubleTap: () =>
          valueNotifierPencilVisible.value = !valueNotifierPencilVisible.value,
          onTap: () => (dayExpense is BigInt)
              ?_addDayExpense(context):null,
          onLongPress: ()=>
          valueNotifierLongPress.value = !valueNotifierLongPress.value,
          onSecondaryLongPress: ()=> _delete(context),
          child: Card(
            child: Container(
              padding: const EdgeInsets.only(
                left: 25,
              ),
              height: 65,
              //width: double.maxFinite,
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
                        if(dayExpense is DayExpense)Text('${dayExpense.dateTime.year} '
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
                      return Visibility(
                        visible: dayExpense is BigInt,
                        child: Row(
                          children: [
                            ValueListenableBuilder<bool>(
                              valueListenable: valueNotifierPencilVisible,
                              builder: (context, value, __) => Visibility(
                                visible: value,
                                child: AddCategory(
                                  contextMacro: context,
                                  statusUserProp: widget.statusUserProp,
                                  categoryExpenses: widget.categoryExpenses,
                                  icon: const Icon(Icons.edit),
                                  addCategory: false,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(HomeDetailPage.routeName,
                                  arguments: {
                                    'statusUserProp': widget.statusUserProp,
                                    'categoryExpenses': widget.categoryExpenses,
                                  },
                                );
                              },
                              icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(int.parse('FF${widget.categoryExpenses.colorHex}', radix: 16))
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return ElevatedButton(onPressed: () => _delete(context),
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
      ),
    );
  }
}
