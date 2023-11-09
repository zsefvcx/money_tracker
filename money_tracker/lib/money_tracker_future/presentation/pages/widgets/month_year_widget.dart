
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/widgets/widgets.dart';

class MonthYearWidget extends StatefulWidget {
  const MonthYearWidget({required this.monthCurrent, super.key});

  final MonthCurrent monthCurrent;

  @override
  State<MonthYearWidget> createState() => _MonthYearWidgetState();
}

class _MonthYearWidgetState extends State<MonthYearWidget> {
  late MonthCurrent _monthCurrent;

  @override
  void initState() {
    super.initState();
    _monthCurrent = widget.monthCurrent;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final checkYear = _monthCurrent.year==widget.monthCurrent.year;

    if (kDebugMode) {
      print(checkYear);
    }


    return Column(
      mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.center,
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
                  IconButton(onPressed: () {
                    setState(() {
                      _monthCurrent = _monthCurrent.copyWith(
                          year: _monthCurrent.year+1
                      );
                    });
                  }, icon: Icon(Icons.expand_less,
                    color:  theme.colorScheme.background,
                  )),
                  IconButton(onPressed: () {
                    setState(() {
                      _monthCurrent = _monthCurrent.copyWith(
                          year: _monthCurrent.year-1
                      );
                    });
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
                          select: j+1==widget.monthCurrent.month
                              && checkYear
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
                if (kDebugMode) {
                  print('Select');
                }
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
    );
  }
}
