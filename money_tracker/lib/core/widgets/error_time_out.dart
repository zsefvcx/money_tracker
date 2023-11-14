
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/login_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';

class ErrorTimeOut<B, T> extends StatelessWidget {
  const ErrorTimeOut({
    this.uuid,
    this.tCurrent,
    super.key,
  });

  final String? uuid;
  final T? tCurrent;

  @override
  Widget build(BuildContext context) {
    final blocBloc = context.read<B>();
    final tCurrentLocal = tCurrent;
    final localUuid = uuid;
    if(blocBloc is MonthBloc
        || blocBloc is CategoriesBloc
        || blocBloc is UserAuthBloc) {
      var isError = true;
      var isTimeOut = false;
      if(blocBloc is MonthBloc){
        isError = blocBloc.modelData.isError;
      } else if(blocBloc is CategoriesBloc){
        isTimeOut = blocBloc.modelData.isError;
      } else if(blocBloc is UserAuthBloc){
        isTimeOut = blocBloc.modelData.isError;
      }

      return Padding(
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
                      if(tCurrentLocal is MonthCurrent && blocBloc is MonthBloc && localUuid != null) {
                        blocBloc.add(
                            MonthBlocEvent.init(uuid: localUuid, data: tCurrentLocal)
                        );
                      } else if(blocBloc is CategoriesBloc && localUuid != null){
                        blocBloc.add(
                            CategoriesBlocEvent.init(uuid: localUuid)
                        );
                      } else if(blocBloc is UserAuthBloc){
                        blocBloc.add(
                            const UserAuthEvent.init()
                        );
                      } else {
                        throw Exception('Error build ErrorTimeOut pages');
                      }
                    },
                    child: Text(S.of(context).repeat)),
                TextButton(
                    onPressed: () {
                      if(tCurrentLocal is MonthCurrent && blocBloc is MonthBloc && localUuid != null) {
                        blocBloc.add(
                            MonthBlocEvent.delete(uuid: localUuid, data: tCurrentLocal)
                        );
                      } else if(blocBloc is CategoriesBloc && localUuid != null){
                        blocBloc.add(
                            CategoriesBlocEvent.delete(uuid: localUuid)
                        );
                      } else if(blocBloc is UserAuthBloc){
                        blocBloc..add(const UserAuthEvent.delete())
                          ..add(const UserAuthEvent.init());
                      } else {
                        throw Exception('Error build ErrorTimeOut pages');
                      }
                    },
                    child: Text(S.of(context).deleteUserData)),
              ],
            ),
          ),
      );
    } else {
      throw Exception('Error build ErrorTimeOut pages');
    }
  }
}
