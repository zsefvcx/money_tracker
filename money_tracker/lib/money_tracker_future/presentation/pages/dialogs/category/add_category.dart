
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/category/dialog_category.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:provider/provider.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({
    required this.icon,
    required this.statusUserProp,
    required this.contextMacro,
    this.categoryExpenses,
    this.addCategory = true,
    super.key
  });

  final BuildContext contextMacro;
  final StatusUserProp statusUserProp;
  final CategoryExpenses? categoryExpenses;
  final bool addCategory;
  final Widget icon;

  @override
  Widget build(BuildContext context) {

    final categoriesBloc = context.read<CategoriesBloc>();

    return IconButton(onPressed: () async {
      if(addCategory) {
        final localLen = categoriesBloc.modelData.data?.categoriesId.length;
        if (localLen != null && localLen >= 20) {
            Logger.print(S
              .of(context)
              .noMoreThan20Categories, context: contextMacro);

          return;
        }
      }
      final res = await showDialog<CategoryExpenses?>(
        context: context,
        builder: (context) {
          return DialogCategory(
            categoryExpenses: categoryExpenses,
            addCategory: addCategory,
            icon: icon,
          );
        },
     );
      if(res != null && res != categoryExpenses) {
        final completer = Completer<bool?>();
        categoriesBloc.add(CategoriesBlocEvent.check(
          uuid: statusUserProp.uuid,
          data: res,
          completer: completer
        ));
        final checkData = await completer.future;
        if (checkData != null && !checkData ){
          if(contextMacro.mounted) {
            Logger.print(S
              .of(contextMacro)
              .theCategoryAlreadyExistsChangeTheDetails, context: contextMacro);
          }
          return;
        }
        
        
        if(addCategory){
            categoriesBloc.add(CategoriesBlocEvent.add(
              uuid: statusUserProp.uuid,
              data: res,
            ));
        } else {
          categoriesBloc.add(CategoriesBlocEvent.update(
              uuid: statusUserProp.uuid,
              data: res,
          ));
        }
      }

    }, icon: icon);
  }
}
