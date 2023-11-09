
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';

class AppCalendarDialog extends StatelessWidget {
  const AppCalendarDialog({required this.monthCurrent, super.key});

  final MonthCurrent monthCurrent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          showDialog<MonthCurrent?>(
            context: context,
            builder: (context) => Dialog(
              // insetPadding: const EdgeInsets.only(
              //   left: 25, right: 25,
              // ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 104,
                    color: theme.colorScheme.primary,


                  ),

                  for(var month = 1; month <= 12; month++)
                    Text(
                      NameMonth(context).toNameMonth(month),

                    ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15, bottom: 30,
                      left: 25, right: 25,
                    ),
                    child: Column(
                      children: [
                        ElevatedButton(onPressed: () {
                          if (kDebugMode) {
                            print('Select');
                          }
                        },
                          child: Text(S.of(context).add),
                          style: theme.elevatedButtonTheme.style?.copyWith(

                            minimumSize: const MaterialStatePropertyAll(Size(
                                double.maxFinite,50
                            )),
                          ),
                        ),
                        15.h,
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(S.of(context).close, style: theme.dialogTheme.contentTextStyle),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        child: Text(
            '${NameMonth(context).toNameMonth(monthCurrent.month)} ${monthCurrent.year}'
        ),
      )
    );
  }
}
