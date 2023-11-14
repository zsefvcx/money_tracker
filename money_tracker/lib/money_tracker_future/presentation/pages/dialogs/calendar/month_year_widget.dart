import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:provider/provider.dart';

part 'month_button.dart';

class MonthYearWidget extends StatefulWidget {
  const MonthYearWidget({
    required this.selectedMonth,
    required this.monthCurrent,
    required this.monthBloc,
    required this.uuid,
    super.key
  });

  final MonthCurrent monthCurrent;
  final Set<int>? selectedMonth;
  final MonthBloc monthBloc;
  final String uuid;

  @override
  State<MonthYearWidget> createState() => _MonthYearWidgetState();
}

class _MonthYearWidgetState extends State<MonthYearWidget> {
  late MonthCurrent _monthCurrent;

  int selectMonth = 0;
  List<bool> selectedMonth = List<bool>.generate(12, (index) => false);

  void select(int month){
    setState(() {
      selectMonth = month;
    });
  }

  @override
  void initState() {
    super.initState();
    _monthCurrent = widget.monthCurrent;
    selectedMonth[_monthCurrent.month-1] = true;
    widget.selectedMonth?.forEach((month) {
      if(month>0 && month<=12){
        selectedMonth[month-1] = true;
      }
    });
    selectMonth = widget.monthCurrent.month;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Future<void> upOrDown(Function() fun) async {
      fun.call();
      final completer = Completer();
      widget.monthBloc.add(MonthBlocEvent.read(
        uuid: widget.uuid,
        year: _monthCurrent.year,
        completer: completer,
      ));
      await completer.future;
      final selectedMonthSet = widget.monthBloc.modelData.data?.months;
      //final selectedYear = widget.monthBloc.monthModelData.data?.year;
      selectedMonth = List<bool>.generate(12, (index) => false);
      //if(selectedYear==widget.monthCurrent.year)selectedMonth[_monthCurrent.month-1] = true;
      selectedMonthSet?.forEach((month) {
        if(month>0 && month<=12){
          selectedMonth[month-1] = true;
        }
      });
      selectMonth=_monthCurrent.year==widget.monthCurrent.year
          ?widget.monthCurrent.month
          :0;
      setState(() {
      });
    }

    return Provider.value(
      value: this,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 110,
            padding: const EdgeInsets.only(
              bottom: 30, top: 15,
              left: 25, right: 25,
            ),
            decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(NameMonth(context).toNameMonth(_monthCurrent.month),
                        style: theme.textTheme.displayLarge?.copyWith(
                            fontSize: 12,
                            color:  theme.colorScheme.background
                        )
                    ),
                    10.h,
                    Text(_monthCurrent.year.toString(),
                        style: theme.textTheme.titleLarge?.copyWith(
                            fontSize: 20,
                            color:  theme.colorScheme.background
                        )
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: () async {
                      await upOrDown(() {
                        final id = _monthCurrent.id;
                        _monthCurrent = _monthCurrent.copyWithId(
                            id: id,
                            year: _monthCurrent.year+1
                        );
                      },);
                    }, icon: Icon(Icons.expand_less,
                      color:  theme.colorScheme.background,
                    )),
                    IconButton(onPressed: () async {
                      await upOrDown(() {
                        final id = _monthCurrent.id;
                        _monthCurrent = _monthCurrent.copyWithId(
                            id: id,
                            year: _monthCurrent.year-1
                        );
                      },);
                    }, icon: Icon(Icons.expand_more,
                      color: theme.colorScheme.background,
                    )),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15, top: 15,
              left: 25, right: 25,
            ),
            child: Column(
              children: <Widget>[
                for(var i = 0; i < 3; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for(var j = 4*i; j < 4+4*i; j++)
                        MonthButton(
                            month: j+1,
                            select: selectedMonth[j]
                        ),
                    ],
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
              left: 25, right: 25,
            ),
            child: Column(
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.pop(context, (selectMonth>0 && selectMonth<=12)?_monthCurrent.copyWithId(
                    id: null,
                    month: selectMonth
                  ):null);
                },
                  child: Text(S.of(context).confirm),
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
    );
  }
}
