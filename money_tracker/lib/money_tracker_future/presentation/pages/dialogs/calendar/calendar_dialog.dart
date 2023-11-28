import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/calendar/month_year_widget.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/widgets/widgets.dart';
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final monthBloc = context.read<MonthBloc>();
    final categoriesBloc = context.read<CategoriesBloc>();
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
                insetPadding: const EdgeInsets.only(left: 25, right: 25),
                child: MonthYearWidget(
                  monthCurrent: widget.monthCurrent,
                  selectedMonth: selectedMonth,
                  monthBloc: monthBloc,
                  uuid: widget.uuid,
                ),
              ),
            );

            if (monthCurrent !=null && widget.monthCurrent != monthCurrent) {
              monthBloc.add(MonthBlocEvent.add(
                  uuid: widget.uuid,
                  data: monthCurrent)
              );
              categoriesBloc.add(CategoriesBlocEvent.init(uuid: widget.uuid));
            }
          }
        },
        child: StackTextTwice(
          text: '${NameMonth(context).toNameMonth(widget.monthCurrent.month)} '
              '${widget.monthCurrent.year}',
          color: theme.appBarTheme.backgroundColor,
        ),
      )
    );
  }
}
