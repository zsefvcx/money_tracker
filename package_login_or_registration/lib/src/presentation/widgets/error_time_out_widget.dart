
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_login_or_registration/src/core/core.dart';
import 'package:package_login_or_registration/src/domain/bloc/user_auth_bloc.dart';


class ErrorTimeOutWidget extends StatelessWidget {
  const ErrorTimeOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final blocBloc = context.read<GetUserAuthBloc>();
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
        if(blocBloc.userAuthData.isError)Text('Ошибка!'.hardcoded) else
        Text('Случилось что-то не то...'.hardcoded),
        if(blocBloc.userAuthData.isTimeOut)Text('Таймаут'.hardcoded) else
          Text('Ответ получен.'.hardcoded),
        const SizedBox(
          height: 50,
        ),
        TextButton(
            onPressed: () {
              blocBloc.add(const UserAuthEvent.init());
            },
            child: Text('Повторить'.hardcoded)),
      ],
    );
  }
}
