import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';

class MainBuilderForm extends StatefulWidget {
  const MainBuilderForm({
    required this.uuid,
    required this.eMail,
    required this.loadImage,
    super.key});

  final String uuid;
  final String eMail;
  final bool loadImage;

  @override
  State<MainBuilderForm> createState() => _MainBuilderFormState();
}

class _MainBuilderFormState extends State<MainBuilderForm> {
  @override
  Widget build(BuildContext context) {
    final monthBloc = context.read<MonthBloc>();
    final dataTimeNow = DateTime.now();
    final monthCurrent = MonthCurrent(
        id: null,
        year: dataTimeNow.year,
        month: dataTimeNow.month
    );
    monthBloc.add(MonthBlocEvent.init(
        uuid: widget.uuid,
        data: monthCurrent)
    );


    return SafeArea(
      child: BlocBuilder<MonthBloc, MonthBlocState>(
        builder: (context, state) {
          return state.map(
            loading: (_)=> const Scaffold(
              body: Padding(
                padding: EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 25,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(tag: Keys.heroIdSplash, child: MainSplash(),),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            ),

            error: (_)=> ErrorTimeOut(uuid: widget.uuid, monthCurrent: monthCurrent),
            timeOut: (_)=> ErrorTimeOut(uuid: widget.uuid, monthCurrent: monthCurrent),

            loaded: (value) {
              final localMonthCurrent = value.monthCurrent;
              if (localMonthCurrent == null){
                return ErrorTimeOut(uuid: widget.uuid, monthCurrent: monthCurrent);
              }
              return MoneyTrackerHomePage(
                uuid: widget.uuid,
                eMail: widget.eMail,
                loadImage: widget.loadImage,
                monthCurrent: localMonthCurrent,
              );
            },
          );
        },
      ),
    );
  }
}
