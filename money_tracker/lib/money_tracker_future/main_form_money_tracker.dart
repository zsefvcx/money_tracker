
import 'package:flutter/material.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:money_tracker/money_tracker_future/src.dart';
import 'package:provider/provider.dart';

class MainFormMoneyTracker extends StatelessWidget {
  static const routeName = r'\PageMoneyTracker';

  const MainFormMoneyTracker({
    required this.statusUserProp,
    super.key
  });

  final StatusUserProp statusUserProp;

  @override
  Widget build(BuildContext context) {
    context.read<MonthBloc>().add(MonthBlocEvent.init(
      uuid: statusUserProp.uuid,
      data: statusUserProp.monthCurrent)
    );

    return MainBuilderForm(
      statusUserProp: statusUserProp,
    );
  }
}
