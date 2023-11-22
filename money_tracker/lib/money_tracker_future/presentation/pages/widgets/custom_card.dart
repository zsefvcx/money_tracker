
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/dialogs.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    required this.dayExpense,
    required this.statusUserProp,
    required this.categoryExpenses,
    super.key
  });

  final StatusUserProp statusUserProp;
  final CategoryExpenses categoryExpenses;
  final int dayExpense;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {

  final valueNotifierDayExpense  = ValueNotifier<int>(0);
  final valueNotifierLongPress  = ValueNotifier<bool>(false);
  final valueNotifierPencilVisible  = ValueNotifier<bool>(false);

  @override
  void initState() {
    valueNotifierDayExpense.value = widget.dayExpense;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    valueNotifierDayExpense.dispose();
    valueNotifierLongPress.dispose();
    valueNotifierPencilVisible.dispose();
  }







  Future<bool> _deleteCategory(CategoriesBloc categoriesBloc, int id, String name, BuildContext context) async {
    final res = await showDialog<bool>(
      context: context,
      builder: (context) => Dialog(
          child: DeleteCategoryDialog(name: name,),
      ),
    );

    if (res != null && res) {
      categoriesBloc.add(CategoriesBlocEvent.deleteId(
          uuid: widget.statusUserProp.uuid,
          id: id));
      return true;
    }
    return false;
  }

  Future<void> _addDayExpense(int id, BuildContext context) async {

    final res = await showDialog<int>(
      context: context,
      builder: (context) => Dialog(
        child: AddDayExpense(id: id),
      ),
    );

    final total = valueNotifierDayExpense.value;
    valueNotifierDayExpense.value = total + (res??0);

    //Послать на сохранение дата + трата

    //изменить количество только для текущего месяца

    //Дату брать текущий месяц календарны = текущая дата, иначяе первое число месяца
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categoriesBloc = context.read<CategoriesBloc>();

    final id = widget.categoryExpenses.id??(throw Exception('Error search Key'));

    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (direction) => _deleteCategory(categoriesBloc, id, widget.categoryExpenses.name, context),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onExit: (event) {
          valueNotifierLongPress.value = false;
          valueNotifierPencilVisible.value = false;
        },
        child: GestureDetector(
          onDoubleTap: () => valueNotifierPencilVisible.value = !valueNotifierPencilVisible.value,
          onTap: () => _addDayExpense(id, context),
          onLongPress: ()=>
          valueNotifierLongPress.value = !valueNotifierLongPress.value,
          onSecondaryLongPress: ()=> _deleteCategory(categoriesBloc, id, widget.categoryExpenses.name, context),
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
                          widget.categoryExpenses.name,
                          style: theme.textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        9.h,
                        ValueListenableBuilder(
                            valueListenable: valueNotifierDayExpense,
                            builder: (_, value, __) {
                              return  Text(S.of(context).totalDayexpense(value),
                                style:  theme.textTheme.bodySmall,
                              );
                            },
                        ),
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
                                statusUserProp: widget.statusUserProp,
                                categoryExpenses: widget.categoryExpenses,
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
                                color: Color(int.parse('FF${widget.categoryExpenses.colorHex}', radix: 16))
                            ),
                          ),
                        ],
                      );
                    } else {
                      return ElevatedButton(onPressed: () => _deleteCategory(categoriesBloc, id, widget.categoryExpenses.name, context),
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
