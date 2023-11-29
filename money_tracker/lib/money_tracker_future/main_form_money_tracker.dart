
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:money_tracker/money_tracker_future/src.dart';

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

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocBuilder<MonthBloc, MonthBlocState>(
          builder: (context, state) {
            return state.map(
              loading: (_)=> const CircularProgressIndicatorMod(),
              error: (_)=> ErrorTimeOut<MonthBloc, MonthCurrent>(
                    uuid: statusUserProp.uuid,
                    tCurrent: statusUserProp.monthCurrent
              ),
              timeOut: (_)=> ErrorTimeOut<MonthBloc, MonthCurrent>(
                    uuid: statusUserProp.uuid,
                    tCurrent: statusUserProp.monthCurrent
              ),
              loaded: (value) {
                final localMonthCurrent = value.monthCurrent;
                if (localMonthCurrent == null){
                  return ErrorTimeOut<MonthBloc, MonthCurrent>(
                        uuid: statusUserProp.uuid,
                        tCurrent: statusUserProp.monthCurrent
                  );
                }
                final localStatusUserProp = statusUserProp.copyWith(
                    monthCurrent: localMonthCurrent
                );
                return MoneyTrackerHomePage(
                  statusUserProp: localStatusUserProp,
                );

              },
            );
          },
        ),
      ),
    );
  }
}
