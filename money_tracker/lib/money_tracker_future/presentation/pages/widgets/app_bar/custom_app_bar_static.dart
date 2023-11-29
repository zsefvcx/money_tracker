import 'package:flutter/material.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/dialogs.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';

class CustomAppBarStatic extends StatelessWidget  implements PreferredSizeWidget{
  const CustomAppBarStatic({
    required this.value,
    required this.statusUserProp,
    this.height = kToolbarHeight,
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  final int value;
  final double height;
  final StatusUserProp statusUserProp;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      systemOverlayStyle: theme.appBarTheme.systemOverlayStyle,
      backgroundColor: theme.appBarTheme.backgroundColor,
      centerTitle: theme.appBarTheme.centerTitle,
      iconTheme: theme.appBarTheme.iconTheme,
      titleTextStyle: theme.appBarTheme.titleTextStyle,
      title: value==0
          ? AppCalendarDialog(
              uuid: statusUserProp.uuid,
              monthCurrent: statusUserProp.monthCurrent)
          : StackTextTwice(
        text: S.of(context).profile,
        color: theme.appBarTheme.backgroundColor,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: value==0,
                child: AddEditCategory(
                  contextMacro: context,
                  statusUserProp: statusUserProp,
                  icon: const ContainerIconShadow(
                      icon: Icons.add
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
