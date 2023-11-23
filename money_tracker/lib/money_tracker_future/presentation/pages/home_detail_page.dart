
import 'package:flutter/material.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:money_tracker/money_tracker_future/src.dart';

class HomeDetailPage  extends StatelessWidget {
  static const routeName = r'\PageHomeDetailPage';

  const HomeDetailPage ({
    required this.categoryExpenses,
    required this.statusUserProp,
    super.key});

  final StatusUserProp statusUserProp;
  final CategoryExpenses categoryExpenses;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(MainFormMoneyTracker.routeName);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(categoryExpenses.name),
          backgroundColor: Color(int.parse('FF${categoryExpenses.colorHex}', radix: 16)),
        ),

        body: const Placeholder());

  }
}
