import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/calendar/month_year_widget.dart';

class AppCalendarDialog extends StatefulWidget {
  const AppCalendarDialog({required this.monthCurrent, super.key});

  final MonthCurrent monthCurrent;

  @override
  State<AppCalendarDialog> createState() => _AppCalendarDialogState();
}

class _AppCalendarDialogState extends State<AppCalendarDialog> {

  late MonthCurrent _monthCurrent;

  @override
  void initState() {
    super.initState();
    _monthCurrent = widget.monthCurrent;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          showDialog<MonthCurrent?>(
            context: context,
            builder: (context) => Dialog(
              child: MonthYearWidget(monthCurrent: _monthCurrent,),
            ),
          );
        },
        child: Text(
            '${NameMonth(context).toNameMonth(_monthCurrent.month)} ${_monthCurrent.year}'
        ),
      )
    );
  }
}
