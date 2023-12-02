import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/dialogs.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';

class HomeDetailPage extends StatefulWidget {
  static const routeName = r'\PageHomeDetailPage';

  const HomeDetailPage(
      {required this.categoryExpenses,
      required this.statusUserProp,
      required this.dateTime,
      required this.updateCard,
      required this.total,
      super.key});

  final StatusUserProp statusUserProp;
  final CategoryExpenses categoryExpenses;
  final DateTime dateTime;
  final Future<void> Function(BigInt? data) updateCard;
  final BigInt total;
  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final _valueNotifierNeedsToBeUpdatedList = ValueNotifier<bool>(false);

  var _localCompleteExpenses = <int, DayExpense>{};

  @override
  void initState() {
    Future.delayed(Duration.zero,()async=>_update(null),);

    super.initState();
  }

  @override
  void dispose() {
    _valueNotifierNeedsToBeUpdatedList.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final idCategory = widget.categoryExpenses.id;
    final categoryExpensesColor =
        Color(int.parse('FF${widget.categoryExpenses.colorHex}', radix: 16));



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
              final newTotal = _localCompleteExpenses.values.fold(BigInt.zero, (previousValue, element) => previousValue+element.sum);
              if(widget.total != newTotal) {
                widget.updateCard.call(newTotal);
              }
              Navigator.of(context).pop();
            },
            child: IconButton(
              onPressed: () {
                final newTotal = _localCompleteExpenses.values.fold(BigInt.zero, (previousValue, element) => previousValue+element.sum);
                if(widget.total != newTotal) {
                  widget.updateCard.call(newTotal);
                }
                Navigator.of(context).pop();
              },
              icon: const Hero(tag: Keys.heroIdSplash,
                child: ContainerIconShadow(
                  icon: Icons.arrow_back_ios,
                ),
              ),
            ),
          ),
        ),
        title: Hero(
          tag: '${Keys.heroIdSplash}${idCategory ?? ''}',
          child: StackTextTwice(
            text: widget.categoryExpenses.name,
            color: categoryExpensesColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: AddEditDayExpense(
                typeWidget: TypeWidget.fromHomeDetailAdd,
                statusUserProp: widget.statusUserProp,
                categoryExpenses: widget.categoryExpenses,
                child: const ContainerIconShadow(icon: Icons.add),
                update: _update,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () async => _update(null),
          child: ValueListenableBuilder<bool>(
            valueListenable: _valueNotifierNeedsToBeUpdatedList,
            builder: (_, value, __) => ListView.builder(
                padding: const EdgeInsets.all(12.5),
                itemCount: _localCompleteExpenses.length,
                itemBuilder: (_, index) {
                  final data = _localCompleteExpenses;
                  final dayExpense = data.values.elementAt(index);
                  Logger.print('dayExpense:$dayExpense');
                  return Dismissible(
                    key: UniqueKey(),
                    confirmDismiss: (_) async {
                      return _deleteDayExpense(context, dayExpense);
                    },
                    child: CustomCard<DayExpense>(
                      dayExpense: dayExpense,
                      statusUserProp: widget.statusUserProp,
                      categoryExpenses: widget.categoryExpenses,
                      deleteCard: (context) =>
                          _deleteDayExpense(context, dayExpense),
                      update: _update,
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  Future<void> _update(DayExpense? data, {int? id}) async {
    if(id != null){
      _localCompleteExpenses.remove(id);
      _valueNotifierNeedsToBeUpdatedList.value =
      !_valueNotifierNeedsToBeUpdatedList.value;
      return;
    }

    if(data == null){
      _localCompleteExpenses = await _read();
      _valueNotifierNeedsToBeUpdatedList.value =
         !_valueNotifierNeedsToBeUpdatedList.value;
    } else {
      final id = data.id;
      if (id != null) {
        _localCompleteExpenses.remove(id);
        if(data.dateTime.month == widget.dateTime.month &&
           data.dateTime.year == widget.dateTime.year){
          _localCompleteExpenses.putIfAbsent(id, () => data);
          _localCompleteExpenses = categoriesIdSort(_localCompleteExpenses);
          _valueNotifierNeedsToBeUpdatedList.value =
          !_valueNotifierNeedsToBeUpdatedList.value;
        }
      }
    }
  }

  Map<int, DayExpense> categoriesIdSort(Map<int, DayExpense> data) =>
      <int, DayExpense>{
        for (final element in (data.values.toList()
            ..sort((e1, e2) => e1.sum.compareTo(e2.sum))))element.id??(throw Exception('Error id')):element
  };


  Future<Map<int, DayExpense>> _read() async {
    final idMonth = widget.statusUserProp.monthCurrent.id;
    final idCategory = widget.categoryExpenses.id;
    var localCompleteExpenses = <DayExpense>{};
    if (idMonth != null && idCategory != null) {
      final completer = Completer<MonthlyExpensesEntity>();
      context.read<MonthlyExpensesBloc>().add(MonthlyExpensesBlocEvent.read(
            uuid: widget.statusUserProp.uuid,
            idMonth: idMonth,
            idCategory: idCategory,
            completer: completer,
          ));
      localCompleteExpenses = (await completer.future).completeExpenses;
    }
    //Тут сортировка по бигинту, а  в базе данных по строке...
    final res = <int, DayExpense>{};

    for(final elem in  localCompleteExpenses){
      final id = elem.id;
      if(id == null) continue;
      res.putIfAbsent(id, () => elem);
    }

    return categoriesIdSort(res);
  }

  Future<bool> _deleteDayExpense(
      BuildContext context, DayExpense dayExpense) async {
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
        monthlyExpensesBloc
          .add(MonthlyExpensesBlocEvent.deleteId(
              uuid: widget.statusUserProp.uuid, id: id));
        await _update(null, id: id);
        return true;
      }
    }
    return false;
  }
}
