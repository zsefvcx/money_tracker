import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/entity/categories/categories_entity.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:money_tracker/money_tracker_future/src.dart';

class HomeDetailPage extends StatelessWidget {
  static const routeName = r'\PageHomeDetailPage';

  const HomeDetailPage({
    required this.categoryExpenses,
    required this.statusUserProp,
    super.key});

  final StatusUserProp statusUserProp;
  final CategoryExpenses categoryExpenses;


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
                  },
                );
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: Hero(tag: '${Keys.heroIdSplash}${idCategory??''}',
                child: Text(categoryExpenses.name)
            ),
            backgroundColor: Color(
                int.parse('FF${categoryExpenses.colorHex}', radix: 16)),
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
                          return CustomCard<DayExpense>(
                            dayExpense:dayExpense,
                            statusUserProp: statusUserProp,
                            categoryExpenses: categoryExpenses,
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
}
