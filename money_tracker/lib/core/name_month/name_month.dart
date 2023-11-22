
import 'package:flutter/cupertino.dart';
import 'package:money_tracker/generated/l10n.dart';

class NameWeekday{
  late Map<int, String> _weekday;

  BuildContext context;

  NameWeekday(this.context){
    _weekday = <int, String>{
      1: S.of(context).monday,
      2: S.of(context).tuesday,
      3: S.of(context).wednesday,
      4: S.of(context).thursday,
      5: S.of(context).friday,
      6: S.of(context).saturday,
      7: S.of(context).sunday,
    };
  }


  String toNameWeekday(int weekday) => _weekday[weekday]??'none';
}


class NameMonth{
  late Map<int, String> _monthName;

  BuildContext context;

  NameMonth(this.context){
    _monthName = <int, String>{
      1: S.of(context).january,
      2: S.of(context).february,
      3: S.of(context).march,
      4: S.of(context).april,
      5: S.of(context).may,
      6: S.of(context).june,
      7: S.of(context).july,
      8: S.of(context).august,
      9: S.of(context).september,
      10: S.of(context).october,
      11: S.of(context).november,
      12: S.of(context).december,
    };
  }


  String toNameMonth(int month) => _monthName[month]??'none';
}
