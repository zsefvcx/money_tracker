import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';

class MainBuilderForm extends StatelessWidget {
  const MainBuilderForm({super.key});

  @override
  Widget build(BuildContext context) {
    final statusUserProp = context.read<StatusUserProp>();

    return SafeArea(
      child: BlocBuilder<MonthBloc, MonthBlocState>(
        builder: (context, state) {
          return state.map(
            loading: (_)=> const Scaffold(body: CircularProgressIndicatorMod()),

            error: (_)=> Scaffold(
              body: ErrorTimeOut<MonthBloc, MonthCurrent>(
                  uuid: statusUserProp.uuid,
                  tCurrent: statusUserProp.monthCurrent
              ),
            ),
            timeOut: (_)=> Scaffold(
              body: ErrorTimeOut<MonthBloc, MonthCurrent>(
                  uuid: statusUserProp.uuid,
                  tCurrent: statusUserProp.monthCurrent
              ),
            ),
            loaded: (value) {
              final localMonthCurrent = value.monthCurrent;
              if (localMonthCurrent == null){
                return Scaffold(
                  body: ErrorTimeOut<MonthBloc, MonthCurrent>(
                      uuid: statusUserProp.uuid,
                      tCurrent: statusUserProp.monthCurrent
                  ),
                );
              }
              return const MoneyTrackerHomePage();
            },
          );
        },
      ),
    );
  }
}
