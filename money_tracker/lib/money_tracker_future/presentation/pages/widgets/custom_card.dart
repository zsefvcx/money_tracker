
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/dialogs.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.categoryExpenses,
    super.key
  });

  final CategoryExpenses categoryExpenses;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categoriesBloc = context.read<CategoriesBloc>();
    final valueNotifierLongPress  = ValueNotifier<bool>(false);
    final valueNotifierPencilVisible  = ValueNotifier<bool>(false);
    final id = categoryExpenses.id??(throw Exception('Error search Key'));
    final statusUserProp = context.read<StatusUserProp>();
    var cardVisible = true;

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        categoriesBloc.add(CategoriesBlocEvent.deleteId(
            uuid: statusUserProp.uuid,
            id: id));
        cardVisible = false;
      },
      child: Visibility(
        visible: cardVisible,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onExit: (event) {
            valueNotifierLongPress.value = false;
            valueNotifierPencilVisible.value = false;
          },
          child: GestureDetector(
            onDoubleTap: () => valueNotifierPencilVisible.value = !valueNotifierPencilVisible.value,
            onTap: () => showDialog<String>(
              context: context,
              builder: (context) => Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('This is a typical dialog.'),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onLongPress: ()=>
              valueNotifierLongPress.value = !valueNotifierLongPress.value,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            categoryExpenses.name,
                            style: theme.textTheme.titleMedium
                        ),
                        9.h,
                        Text('Всего 3800', style:  theme.textTheme.bodySmall,),
                      ],
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: valueNotifierLongPress,
                      builder: (_, value, __) {
                      if (!value) {
                        return Row(
                          children: [
                            ValueListenableBuilder<bool>(
                              valueListenable: valueNotifierPencilVisible,
                              builder: (_, value, __) => Visibility(
                                visible: value,
                                child: AddCategory(
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
                        return ElevatedButton(onPressed: () {
                            final id = categoryExpenses.id;
                            if (id != null) {
                              categoriesBloc.add(CategoriesBlocEvent.deleteId(
                                  uuid: statusUserProp.uuid,
                                  id: id));
                            }
                          },
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
      ),
    );
  }
}
