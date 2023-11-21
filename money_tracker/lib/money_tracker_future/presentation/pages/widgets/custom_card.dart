
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/dialogs.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.statusUserProp,
    required this.categoryExpenses,
    super.key
  });

  final StatusUserProp statusUserProp;
  final CategoryExpenses categoryExpenses;

  Future<bool> _delete(CategoriesBloc categoriesBloc, int id, String name, BuildContext context) async {
    final res = await showDialog<bool>(
      context: context,
      builder: (context) => Dialog(
          child: DeleteCategoryDialog(name: name,),
      ),
    );

    if (res != null && res) {
      categoriesBloc.add(CategoriesBlocEvent.deleteId(
          uuid: statusUserProp.uuid,
          id: id));
      return true;
    }
    return false;
  }

  void addDayExpense(int id, BuildContext context){
    final theme = Theme.of(context);

    showDialog<String>(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.of(context).addExpense),
                  const Text('1 дек 2023'),
                ],
              ),
              30.h,
              CustomTextFormField(
                //controller: _colorController,
                //focusNode: _focusNodeSecond,
                //nextFocusNode: _focusNodeThree,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                labelText: 'Введите сумму',
                hintText: 'Введите сумму',
                validator: (value) =>
                (   value != null &&
                    RegExp('^[0-9]').hasMatch(value)
                )
                    ?null
                    :'Должны быть только цифры',
                border: OutlineInputBorder(borderSide: BorderSide(
                    color: theme.colorScheme.secondaryContainer,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: theme.colorScheme.secondary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              30.h,
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'true');
                  },
                  child: const Text('Добавить'),
                  style: theme.elevatedButtonTheme.style?.copyWith(
                    minimumSize: const MaterialStatePropertyAll(Size(
                        double.maxFinite,50
                    )),
                  )
              ),
              15.h,
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'false');
                },
                child: Text(S.of(context).close,
                    style: theme.dialogTheme.contentTextStyle
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categoriesBloc = context.read<CategoriesBloc>();
    final valueNotifierLongPress  = ValueNotifier<bool>(false);
    final valueNotifierPencilVisible  = ValueNotifier<bool>(false);
    final id = categoryExpenses.id??(throw Exception('Error search Key'));

    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (direction) => _delete(categoriesBloc, id, categoryExpenses.name, context),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onExit: (event) {
          valueNotifierLongPress.value = false;
          valueNotifierPencilVisible.value = false;
        },
        child: GestureDetector(
          onDoubleTap: () => valueNotifierPencilVisible.value = !valueNotifierPencilVisible.value,
          onTap: () => addDayExpense(id, context),
          onLongPress: ()=>
          valueNotifierLongPress.value = !valueNotifierLongPress.value,
          onSecondaryLongPress: ()=> _delete(categoriesBloc, id, categoryExpenses.name, context),
          child: Card(
            child: Container(
              padding: const EdgeInsets.only(
                left: 25,
              ),
              height: 65,
              //width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        13.h,
                        Text(
                          categoryExpenses.name,
                          style: theme.textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        9.h,
                        Text('Всего 3800', style:  theme.textTheme.bodySmall,),
                        20.h,
                      ],
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: valueNotifierLongPress,
                    builder: (_, value, __) {
                    if (!value) {
                      return Row(
                        children: [
                          ValueListenableBuilder<bool>(
                            valueListenable: valueNotifierPencilVisible,
                            builder: (context, value, __) => Visibility(
                              visible: value,
                              child: AddCategory(
                                contextMacro: context,
                                statusUserProp: statusUserProp,
                                categoryExpenses: categoryExpenses,
                                icon: const Icon(Icons.edit),
                                addCategory: false,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {

                          },
                            icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(int.parse('FF${categoryExpenses.colorHex}', radix: 16))
                            ),
                          ),
                        ],
                      );
                    } else {
                      return ElevatedButton(onPressed: () => _delete(categoriesBloc, id, categoryExpenses.name, context),
                        child: Text(S.of(context).delete,
                          style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.background
                          ),
                        ),
                        style: theme.elevatedButtonTheme.style?.copyWith(
                          surfaceTintColor: MaterialStatePropertyAll(
                              theme.colorScheme.inversePrimary),
                          backgroundColor: MaterialStatePropertyAll(
                              theme.colorScheme.inversePrimary),
                          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          )),
                          minimumSize: const MaterialStatePropertyAll(Size(80, double.maxFinite)),
                          maximumSize: const MaterialStatePropertyAll(Size(80, double.maxFinite)),
                          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                        ),
                      );
                    }
                  }),
                ],
              ),
            ) ,
          ),
        ),
      ),
    );
  }
}
