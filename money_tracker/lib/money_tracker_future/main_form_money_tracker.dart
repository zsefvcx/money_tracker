
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:money_tracker/money_tracker_future/src.dart';

class MainFormMoneyTracker extends StatefulWidget {
  static const routeName = r'\PageMoneyTracker';

  const MainFormMoneyTracker({
    required this.statusUserProp,
    super.key
  });

  final StatusUserProp statusUserProp;

  @override
  State<MainFormMoneyTracker> createState() => _MainFormMoneyTrackerState();
}

class _MainFormMoneyTrackerState extends State<MainFormMoneyTracker> {

  @override
  void initState() {
    super.initState();
    context.read<MonthBloc>().add(MonthBlocEvent.init(
        uuid: widget.statusUserProp.uuid,
        data: widget.statusUserProp.monthCurrent)
    );
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MonthBloc, MonthBlocState>(
          builder: (context, state) {
            return state.map(
              loading: (_)=> const Scaffold(body: CircularProgressIndicatorMod()),
              error: (_)=> Scaffold(
                body: ErrorTimeOut<MonthBloc, MonthCurrent>(
                      uuid: widget.statusUserProp.uuid,
                      tCurrent: widget.statusUserProp.monthCurrent
                ),
              ),
              timeOut: (_)=> Scaffold(
                body: ErrorTimeOut<MonthBloc, MonthCurrent>(
                      uuid: widget.statusUserProp.uuid,
                      tCurrent: widget.statusUserProp.monthCurrent
                ),
              ),
              loaded: (value) {
                final localMonthCurrent = value.monthCurrent;
                if (localMonthCurrent == null){
                  return Scaffold(
                    body: ErrorTimeOut<MonthBloc, MonthCurrent>(
                          uuid: widget.statusUserProp.uuid,
                          tCurrent: widget.statusUserProp.monthCurrent
                    ),
                  );
                }
                final localStatusUserProp = widget.statusUserProp.copyWith(
                    monthCurrent: localMonthCurrent
                );
                return MoneyTrackerHomePage(
                  statusUserProp: localStatusUserProp,
                );

              },
            );
          },
    );
  }
}
