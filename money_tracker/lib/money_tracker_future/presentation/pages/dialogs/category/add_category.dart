
import 'package:flutter/material.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/category/dialog_category.dart';
import 'package:provider/provider.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({
    required this.monthCurrent,
    required this.uuid,
    required this.icon,
    this.addCategory = true,
    this.categoryExpenses,
    super.key
  });

  final bool addCategory;
  final MonthCurrent monthCurrent;
  final Widget icon;
  final String uuid;
  final CategoryExpenses? categoryExpenses;

  @override
  Widget build(BuildContext context) {

    final categoriesBloc = context.read<CategoriesBloc>();

    return IconButton(onPressed: () async {
      final res = await showDialog<CategoryExpenses?>(
      context: context,
      builder: (context) {
        return DialogCategory(
          uuid: uuid,
          monthCurrent: monthCurrent,
          categoryExpenses: categoryExpenses,
          addCategory: addCategory,
          icon: icon,
        );
      },
    );
      if(res != null && res != categoryExpenses) {
        if(addCategory){
          categoriesBloc.add(CategoriesBlocEvent.add(
            uuid: uuid,
            data: res,
          ));
        } else {
          categoriesBloc.add(CategoriesBlocEvent.update(
              uuid: uuid,
              data: res,
          ));
          //context.read<CustomCardState>().setCategoryExpenses(res);
        }
      }

    }, icon: icon);
  }
}
