import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/calendar/month_year_widget.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:provider/provider.dart';

class AppCalendarDialog extends StatefulWidget {
  const AppCalendarDialog({
    required this.uuid,
    required this.monthCurrent,
    super.key
  });

  final MonthCurrent monthCurrent;
  final String uuid;

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
    final monthBloc = context.read<MonthBloc>();
    final moneyTrackerHomePageState= context.read<MoneyTrackerHomePageState>();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final completer = Completer();
          monthBloc.add(MonthBlocEvent.read(
              uuid: widget.uuid,
              year: widget.monthCurrent.year,
              completer: completer,
          ));
          await completer.future;
          final selectedMonth = monthBloc.modelData.data?.months;

          if(context.mounted){
            final monthCurrent = await showDialog<MonthCurrent?>(
              context: context,
              builder: (_) => Dialog(
                child: MonthYearWidget(
                  monthCurrent: _monthCurrent,
                  selectedMonth: selectedMonth,
                  monthBloc: monthBloc,
                  uuid: widget.uuid,
                ),
              ),
            );
            if (monthCurrent !=null && _monthCurrent != monthCurrent) {
              final completer = Completer();
              monthBloc.add(MonthBlocEvent.add(
                  uuid: widget.uuid,
                  data: monthCurrent,
                  completer: completer)
              );
              await completer.future;
              setState(() {
                _monthCurrent = monthCurrent;
              });
              moneyTrackerHomePageState.setMonthCurrent(monthCurrent);
            }
          }
        },
        child: Text(
            '${NameMonth(context).toNameMonth(_monthCurrent.month)} '
                '${_monthCurrent.year}'
        ),
      )
    );
  }
}
