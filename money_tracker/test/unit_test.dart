import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/entity/entity.dart';

void main() {
  group('A group of tests', () {
    test('Entity test', () {

      const category1 = CategoryExpenses(id: 0, name: 'Name1', colorHex: '5895ff', color: Color(0xFF5895ff));
      if (kDebugMode) print('\n');
      if (kDebugMode) print(category1.toMap());
      final category10 = CategoryExpenses.fromMap({'id': 0, 'name': 'Name1', 'colorHex': '5895ff', 'color': 4283995647});
      if (kDebugMode) print(category10);
      if (kDebugMode) print('\n');
      const category2 = CategoryExpenses(id: 1, name: 'Name2', colorHex: '009ff2', color: Color(0xFF009fff));
      const category3 = CategoryExpenses(id: 2, name: 'Name3', colorHex: '5800f2', color: Color(0xFF5800ff));
      if (kDebugMode) print({category1, category2, category3});
      if (kDebugMode) print('\n');
      final CategoriesExpenses categoriesExpenses = CategoriesExpenses();
      categoriesExpenses.completeCategories[category1.id!] = category1;
      categoriesExpenses.completeCategories[category2.id!] = category2;
      categoriesExpenses.completeCategories[category3.id!] = category3;
      if (kDebugMode) print(categoriesExpenses);
      if (kDebugMode) print('\n');
      final dayExpenses1 = DayExpenses(id: 0, idCategory: 0, dateTime: DateTime.now(), sum: BigInt.from(10000000));
      if (kDebugMode) print('\n');
      if (kDebugMode) print(dayExpenses1.toMap());
      final dayExpenses10 = DayExpenses.fromMap({'id': 0, 'idCategory': 0, 'dateTime': '2023-10-26 15:00:37.428551', 'sum': '10000000'});
      if (kDebugMode) print(dayExpenses10);
      if (kDebugMode) print('\n');
      final dayExpenses2 = DayExpenses(id: 1, idCategory: 1, dateTime: DateTime.now(), sum: BigInt.from(20000000));
      final dayExpenses3 = DayExpenses(id: 2, idCategory: 2, dateTime: DateTime.now(), sum: BigInt.from(30000000));
      if (kDebugMode) print({dayExpenses1, dayExpenses2, dayExpenses3});
      if (kDebugMode) print('\n');

      final monthlyExpenses = MonthlyExpenses(
        month: DateTime.now().month,
        year: DateTime.now().year,
      );

      monthlyExpenses.add(dayExpenses1);
      monthlyExpenses.add(dayExpenses2);
      monthlyExpenses.add(dayExpenses3);
      monthlyExpenses.add(DayExpenses.fromMap({
        'id': 10, 'idCategory': 0, 'dateTime': '2023-10-22 15:00:37.428551', 'sum': '10000000'
      }));
      monthlyExpenses.add(DayExpenses.fromMap({
        'id': 11, 'idCategory': 0, 'dateTime': '2023-10-22 15:00:37.428551', 'sum': '10000000'
      }));



      if (kDebugMode) print(monthlyExpenses);

      final yearExpenses = YearExpenses();
      yearExpenses.completeExpense[monthlyExpenses.param] = monthlyExpenses;
      if (kDebugMode) print('\n');
      if (kDebugMode) print(yearExpenses);
      if (kDebugMode) print('\n');
    });
  });
}