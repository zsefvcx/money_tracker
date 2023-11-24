
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(tag: Keys.heroIdSplash, child: Material(
          child: CustomPieChart(
            statusUserProp: statusUserProp,
            categoriesExpensesModels: categories,
          ),
        )),
        Expanded(
          child: ListView.builder(
            itemCount: categories.categoriesId.length,
            itemBuilder: (_, index) {
              return CustomCard<BigInt>(
                dayExpense: BigInt.from(0),
                statusUserProp: statusUserProp,
                categoryExpenses: categories.categoriesId.elementAt(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
