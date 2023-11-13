
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';

class ErrorTimeOut extends StatelessWidget {
  const ErrorTimeOut({
    required this.uuid,
    required this.monthCurrent,
    super.key,
  });

  final String uuid;
  final MonthCurrent monthCurrent;

  @override
  Widget build(BuildContext context) {
    final blocBloc = context.read<MonthBloc>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25, right: 25, top: 10, bottom: 25,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Hero(
                tag: Keys.heroIdSplash,
                child: Icon(
                  Icons.error_outline_rounded,
                  size: 150,
                ),
              ),
              10.h,
              if(blocBloc.monthModelData.isError)Text(S.of(context).error) else
                Text(S.of(context).somethingWrongHappened),
              if(blocBloc.monthModelData.isTimeOut)Text(S.of(context).timeout) else
                Text(S.of(context).replyReceived),
              50.h,
              TextButton(
                  onPressed: () {
                    blocBloc.add(MonthBlocEvent.init(uuid: uuid, data: monthCurrent));
                  },
                  child: Text(S.of(context).repeat)),
              TextButton(
                  onPressed: () {
                    blocBloc.add(MonthBlocEvent.delete(uuid: uuid, data: monthCurrent));
                  },
                  child: Text(S.of(context).deleteUserData)),
            ],
          ),
        ),
      ),
    );
  }
}
