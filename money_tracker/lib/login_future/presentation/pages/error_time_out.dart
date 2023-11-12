
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/login_future/domain/domain.dart';

class ErrorTimeOut extends StatelessWidget {
  const ErrorTimeOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final blocBloc = context.read<UserAuthBloc>();
    return Column(
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
        if(blocBloc.userAuthData.isError)Text(S.of(context).error) else
        Text(S.of(context).somethingWrongHappened),
        if(blocBloc.userAuthData.isTimeOut)Text(S.of(context).timeout) else
          Text(S.of(context).replyReceived),
        const SizedBox(
          height: 50,
        ),
        TextButton(
            onPressed: () {
              blocBloc.add(const UserAuthEvent.init());
            },
            child: Text(S.of(context).repeat)),
        TextButton(
            onPressed: () {
              blocBloc..add(const UserAuthEvent.delete())
                      ..add(const UserAuthEvent.init());
            },
            child: Text(S.of(context).deleteUserData)),
      ],
    );
  }
}
