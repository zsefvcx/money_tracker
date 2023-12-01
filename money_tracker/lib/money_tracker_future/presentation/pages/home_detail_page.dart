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
      super.key});

  final StatusUserProp statusUserProp;
  final CategoryExpenses categoryExpenses;
  final DateTime dateTime;
  final Future<void> Function() updateCard;

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
    Future.delayed(Duration.zero,()async=>_update(),);

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
              widget.updateCard.call();
              Navigator.of(context).pop();
            },
            child: IconButton(
              onPressed: () {
                widget.updateCard.call();
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
          onRefresh: () async => _update(),
          child: ValueListenableBuilder<bool>(
            valueListenable: _valueNotifierNeedsToBeUpdatedList,
            builder: (_, value, __) => ListView.builder(
                padding: const EdgeInsets.all(12.5),
                itemCount: _localCompleteExpenses.length,
                itemBuilder: (_, index) {
                  final data = _localCompleteExpenses;
                  final dayExpense = data.values.elementAt(index);
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

  Future<void> _update(DayExpense? data) async {
    if(data == null){
      _localCompleteExpenses = await _read();
    } else {
      final id = data.id;
      if (id != null) {
        _localCompleteExpenses..remove(id)
        ..putIfAbsent(id, () => data);
      }
    }
  }

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
      _valueNotifierNeedsToBeUpdatedList.value =
          !_valueNotifierNeedsToBeUpdatedList.value;
    }
    final mapCategoriesId = <int, DayExpense>{
      for(final elem in  localCompleteExpenses) elem.id??-1 : elem
    };
    return mapCategoriesId;
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
        await _update();
        return true;
      }
    }
    return false;
  }
}
