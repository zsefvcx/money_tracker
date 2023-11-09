// import 'dart:convert';
//
// import 'package:flutter_test/flutter_test.dart';
// import 'package:money_tracker/money_tracker_future/core/core.dart';
// import 'package:money_tracker/money_tracker_future/data/models/models.dart';
//
// void main() {
//   group('A group of Entity test', () {
//     test('Category tests', () {
//       const category1 = CategoryExpenses(
//           id: 0, name: 'Name1', colorHex: '5895ff');
//       expect(category1.toJson(), <String, dynamic>{
//         'id': 0,
//         'name': 'Name1',
//         'colorHex': '5895ff'
//       });
//
//       final category10 = CategoryExpenses.fromJson(const <String, dynamic>{
//         'id': 0,
//         'name': 'Name1',
//         'colorHex': '5895ff'
//       });
//       expect(category10.toString(),
//           'categoryExpenses: {id: 0, name: Name1, colorHex: 5895ff}');
//
//       final data = jsonEncode(category10.toJson());
//       final json = jsonDecode(data);
//       final category11 = CategoryExpenses.fromJson(json as Map<String, dynamic>);
//       expect(category11==category10, true);
//
//       const category2 = CategoryExpenses(
//           id: 1, name: 'Name2', colorHex: '009ff2');
//       const category3 = CategoryExpenses(
//           id: 2, name: 'Name3', colorHex: '5800f2');
//       final completeCategories = <int, CategoryExpenses>{};
//       final categoriesExpenses = CategoriesExpenses(completeCategories: completeCategories);
//       final completeCategories2 = <int, CategoryExpenses>{};
//       categoriesExpenses.completeCategories[category1.id!] = category1;
//       categoriesExpenses.completeCategories[category2.id!] = category2;
//       categoriesExpenses.completeCategories[category3.id!] = category3;
//       expect(categoriesExpenses.completeCategories.length, 3);
//       expect(categoriesExpenses.toString(),
//           'categoriesExpenses: {{0: categoryExpenses: {id: 0, name: Name1, colorHex: 5895ff}, 1: categoryExpenses: {id: 1, name: Name2, colorHex: 009ff2}, 2: categoryExpenses: {id: 2, name: Name3, colorHex: 5800f2}}}'
//       );
//       final categoriesExpenses2 = CategoriesExpenses(completeCategories: completeCategories2);
//       categoriesExpenses2.completeCategories[category1.id!] = category1;
//       categoriesExpenses2.completeCategories[category2.id!] = category2;
//       expect(categoriesExpenses==categoriesExpenses2, false);
//       categoriesExpenses2.completeCategories[category3.id!] = category3;
//       expect(categoriesExpenses==categoriesExpenses2, true);
//
//       final data1 = jsonEncode(categoriesExpenses.toJson());
//       final json1 = jsonDecode(data1);
//       final categoriesExpenses3 = CategoriesExpenses.fromJson(json1 as Map<String, dynamic>);
//       expect(categoriesExpenses==categoriesExpenses3, true);
//       expect(categoriesExpenses.status(id: 0), true);
//       expect(categoriesExpenses.status(id: 10), false);
//     });
//
//     test('Day Monthly Year Expenses tests', () {
//       final dataTime = DateTime.now();
//       final dayExpenses1 = DayExpense(id: 0, idCategory: 0, dateTime: dataTime, sum: BigInt.from(10000000));
//       expect(dayExpenses1.toJson(), <String, dynamic>{
//         'id': 0,
//         'idCategory': 0,
//         'dateTime': dataTime.toIso8601String(),
//         'sum': '10000000'
//       });
//       final dayExpenses10 = DayExpense.fromJson(const <String, dynamic>{
//         'id': 0,
//         'idCategory': 0,
//         'dateTime':
//         '2023-10-26 15:00:37.428551',
//         'sum': '10000000'});
//       expect(dayExpenses10.toString(), 'dayExpenses: {id: 0, idCategory: 0, dateTime: 2023-10-26 15:00:37.428551, sum: 10000000}');
//       expect(dayExpenses1==dayExpenses10, false);
//       final dayExpenses11 = DayExpense(id: 0, idCategory: 0, dateTime: dataTime, sum: BigInt.from(10000000));
//       expect(dayExpenses1==dayExpenses11, true);
//       final data = jsonEncode(dayExpenses10.toJson());
//       final json = jsonDecode(data);
//       expect(json, dayExpenses10.toJson());
//
//       final dayExpenses2 = DayExpense(id: 1, idCategory: 1, dateTime: dataTime, sum: BigInt.from(60000000));
//       final dayExpenses3 = DayExpense(id: 2, idCategory: 2, dateTime: dataTime, sum: BigInt.from(30000000));
//
//       final completeExpenses = <int, Map<int, Map<int, DayExpense>>>{};
//
//       final monthlyExpenses = MonthlyExpenses(
//         month: dataTime.month,
//         year: dataTime.year,
//         completeExpenses: completeExpenses,
//       );
//
//       final completeExpenses1 = <int, Map<int, Map<int, DayExpense>>>{};
//
//       final monthlyExpenses1 = MonthlyExpenses(
//         month: dataTime.month,
//         year: dataTime.year,
//         completeExpenses: completeExpenses1,
//       );
//
//       monthlyExpenses.add(dayExpenses1);
//       expect(monthlyExpenses.length, 1);
//       expect(monthlyExpenses.status(dayExpenses1), true);
//       monthlyExpenses.add(dayExpenses2);
//       expect(monthlyExpenses.length, 2);
//       monthlyExpenses.add(dayExpenses3);
//       expect(monthlyExpenses.length, 3);
//       monthlyExpenses1.add(dayExpenses1);
//       expect(monthlyExpenses1.length, 1);
//       monthlyExpenses1.add(dayExpenses2);
//       expect(monthlyExpenses1.length, 2);
//       expect(monthlyExpenses==monthlyExpenses1, false);
//       monthlyExpenses1.add(dayExpenses3);
//       expect(monthlyExpenses1.length, 3);
//       expect(monthlyExpenses==monthlyExpenses1, true);
//       monthlyExpenses.add(DayExpense.fromJson(<String, dynamic>{
//         'id': 10, 'idCategory': 0, 'dateTime': dataTime.toString(), 'sum': '10000000'
//       }));
//       expect(monthlyExpenses.length, 4);
//       monthlyExpenses.add(DayExpense.fromJson(<String, dynamic>{
//         'id': 11, 'idCategory': 0, 'dateTime': dataTime.toString(), 'sum': '10000000'
//       }));
//       expect(monthlyExpenses.length, 5);
//       monthlyExpenses.add(DayExpense.fromJson(<String, dynamic>{
//         'id': 12, 'idCategory': 1, 'dateTime': dataTime.toString(), 'sum': '10000000'
//       }));
//       expect(monthlyExpenses.length, 6);
//       monthlyExpenses.add(DayExpense.fromJson(const <String, dynamic>{
//         'id': 13, 'idCategory': 0, 'dateTime': '2023-08-22 15:00:37.428551', 'sum': '10000000'
//       }));
//
//       expect(monthlyExpenses.length, 6);
//       final data1 = jsonEncode(monthlyExpenses.toJson());
//       final json1 = jsonDecode(data1);
//       final monthlyExpenses2 = MonthlyExpenses.fromJson(json1 as Map<String, dynamic>);
//       expect(monthlyExpenses==monthlyExpenses2, true);
//       expect(monthlyExpenses.param, (dataTime.month, dataTime.year));
//       expect(monthlyExpenses.totalSumCategory(0), BigInt.from(30000000));
//       expect(monthlyExpenses.totalSumCategory(10), BigInt.from(0));
//       expect(monthlyExpenses.totalSumCategoryDay(0, dataTime.day), BigInt.from(30000000));
//       expect(monthlyExpenses.totalSumCategoryDay(1, dataTime.day), BigInt.from(70000000));
//       expect(monthlyExpenses.totalSumCategoryDay(0, dataTime.day==21?22:21), BigInt.from(0));
//       expect(monthlyExpenses.totalSumCategoryDay(0, dataTime.day==1?2:1), BigInt.from(0));
//
//       expect(monthlyExpenses1.length, 3);
//       expect(monthlyExpenses1.status(dayExpenses3), true);
//       monthlyExpenses1.rem(value: dayExpenses3);
//       expect(monthlyExpenses1.length, 2);
//       expect(monthlyExpenses1.status(dayExpenses3), false);
//
//       expect(monthlyExpenses1.statusCategory(idCategory: 0), true);
//       monthlyExpenses1.remDataCategory(idCategory: 0);
//       expect(monthlyExpenses1.length, 1);
//       expect(monthlyExpenses1.statusCategory(idCategory: 0), false);
//
//       expect(monthlyExpenses1.length>0, true);
//       monthlyExpenses1.remAll();
//       expect(monthlyExpenses1.length, 0);
//
//     });
//
//     test('Month Allowed tests', () {
//       final  monthEnabled = <int, Set<int>>{};
//       final monthAllowed = MonthAllowedModel(monthEnabled: monthEnabled)
//       ..add(DateTime.parse('2023-10-22 15:00:37.428551'))
//       ..add(DateTime.parse('2023-08-22 15:00:37.428551'))
//       ..add(DateTime.parse('2022-08-22 15:00:37.428551'));
//       final data = jsonEncode(monthAllowed.toJson());
//       expect(data, '{"monthEnabled":{"2023":[10,8],"2022":[8]}}');
//       expect(monthEnabled.length, 2);
//       final json = jsonDecode(data);
//       final monthAllowed2 = MonthAllowedModel.fromJson(json as Map<String, dynamic>);
//       expect(monthAllowed==monthAllowed2, true);
//       expect(monthAllowed.monthEnabled.length, 2);
//       expect(monthAllowed.status(DateTime.parse('2022-08-22 15:00:37.428551')), true);
//       expect(monthAllowed.status(DateTime.parse('2021-08-22 15:00:37.428551')), false);
//     });
//   });
// }
