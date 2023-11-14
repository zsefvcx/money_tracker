
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';

class ErrorTimeOut<B, T> extends StatelessWidget {
  const ErrorTimeOut({
    required this.uuid,
    required this.tCurrent,
    super.key,
  });

  final String uuid;
  final T tCurrent;

  @override
  Widget build(BuildContext context) {
    final blocBloc = context.read<B>();
    final tCurrentLocal = tCurrent;
    if(blocBloc is MonthBloc || blocBloc is CategoriesBloc) {
      var isError = true;
      var isTimeOut = false;
      if(blocBloc is MonthBloc){
        isError = blocBloc.modelData.isError;
      } else if(blocBloc is CategoriesBloc){
        isTimeOut = blocBloc.modelData.isError;
      }

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
              if(isError)Text(S.of(context).error) else
                Text(S.of(context).somethingWrongHappened),
              if(isTimeOut)Text(S.of(context).timeout) else
                Text(S.of(context).replyReceived),
              50.h,
              TextButton(
                  onPressed: () {
                    if(tCurrentLocal is MonthCurrent && blocBloc is MonthBloc) {
                      blocBloc.add(
                        MonthBlocEvent.init(uuid: uuid, data: tCurrentLocal)
                      );
                    } else if(blocBloc is CategoriesBloc){
                      blocBloc.add(
                        CategoriesBlocEvent.init(uuid: uuid)
                      );
                    } else {
                      throw Exception('Error build ErrorTimeOut pages');
                    }
                  },
                  child: Text(S.of(context).repeat)),
              TextButton(
                  onPressed: () {
                    if(tCurrentLocal is MonthCurrent && blocBloc is MonthBloc) {
                      blocBloc.add(
                          MonthBlocEvent.delete(uuid: uuid, data: tCurrentLocal)
                      );
                    } else if(blocBloc is CategoriesBloc){
                      blocBloc.add(
                          CategoriesBlocEvent.delete(uuid: uuid)
                      );
                    } else {
                      throw Exception('Error build ErrorTimeOut pages');
                    }
                  },
                  child: Text(S.of(context).deleteUserData)),
            ],
          ),
        ),
      ),
    );
    } else {
      throw Exception('Error build ErrorTimeOut pages');
    }
  }
}
