
import 'package:flutter/material.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:money_tracker/money_tracker_future/src.dart';
import 'package:provider/provider.dart';

class MainFormMoneyTracker extends StatelessWidget {
  static const routeName = r'\PageMoneyTracker';

  const MainFormMoneyTracker({
    required this.loadImage,
    required this.uuid,
    required this.eMail,
    required this.dateTime,
    super.key
  });

  final String uuid;
  final String eMail;
  final bool loadImage;
  final DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    final monthBloc = context.read<MonthBloc>();
    final dataTimeNow = dateTime??DateTime.now();
    final monthCurrent = MonthCurrent(
        id: null,
        year: dataTimeNow.year,
        month: dataTimeNow.month
    );
    final statusUserProp = StatusUserProp(
      eMail: eMail,
      uuid: uuid,
      loadImage: loadImage,
      monthCurrent: monthCurrent,
    );
    monthBloc.add(MonthBlocEvent.init(
      uuid: uuid,
      data: monthCurrent)
    );

    return MainBuilderForm(
      statusUserProp: statusUserProp,
    );
  }
}
