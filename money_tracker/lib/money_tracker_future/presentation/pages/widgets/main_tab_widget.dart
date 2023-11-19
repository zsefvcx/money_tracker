
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';

class MainTabWidget extends StatelessWidget {
  const MainTabWidget({
    required this.categories,
    super.key
  });

  final CategoriesExpensesModels categories;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(tag: Keys.heroIdSplash, child: Material(
          child: CustomPieChart(
            categoriesExpensesModels: categories,
          ),
        )),
        Expanded(
          child: ListView.builder(
            itemCount: categories.categoriesId.length,
            itemBuilder: (_, index) {
              return CustomCard(
                categoryExpenses: categories.categoriesId.elementAt(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
