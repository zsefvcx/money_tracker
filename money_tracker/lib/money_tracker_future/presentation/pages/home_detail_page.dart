import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/entity/categories/categories_entity.dart';
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
    final theme = Theme.of(context);
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
            leading: IconButton(
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
              icon: Stack(
                children: [
                  Container(
                    height: (theme.iconTheme.size??24)+2,
                    width: (theme.iconTheme.size??24)+2,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: const Color(0xFF000000),
                      size: (theme.iconTheme.size??24)+2,
                    ),
                  ),
                  Container(
                    height: (theme.iconTheme.size??24)+2,
                    width: (theme.iconTheme.size??24)+2,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: theme.iconTheme.size??24,
                    ),
                  ),
                ],
              ),
            ),
            title: Hero(tag: '${Keys.heroIdSplash}${idCategory??''}',
                child: Material(child: Stack(
                  children: [
                    Text(categoryExpenses.name,
                      style: theme.appBarTheme.titleTextStyle?.copyWith(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(categoryExpenses.name,
                      style: theme.appBarTheme.titleTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                  color: categoryExpensesColor,
                )
            ),
            backgroundColor: categoryExpensesColor,
          ),
          body: BlocBuilder<MonthlyExpensesBloc, MonthlyExpensesBlocState>(
            builder: (context, state) {
              return state.map(
                  loading: (_) {
                    return const CircularProgressIndicatorMod();
                  },
                  loaded: (value) {
                    final localCompleteExpenses = value.entity?.completeExpenses;
                    if(localCompleteExpenses !=null){
                      return ListView.builder(
                        itemCount: localCompleteExpenses.length,
                        itemBuilder: (_, index) {
                          final dayExpense = localCompleteExpenses.elementAt(index);
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
                        });
                    }
                    return ErrorTimeOut<MonthlyExpensesBloc, CategoriesExpensesEntity?>(
                      uuid: statusUserProp.uuid,
                      idMonth: idMonth,
                      idCategory: idCategory,
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
          )),
    );
  }

  Future<bool> _deleteDayExpense(BuildContext context, DayExpense dayExpense) async {
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
