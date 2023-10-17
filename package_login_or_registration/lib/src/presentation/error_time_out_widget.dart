
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_login_or_registration/src/domain/bloc/user_auth_bloc.dart';

class ErrorTimeOutWidget extends StatelessWidget {
  const ErrorTimeOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final blocBloc = context.read<GetUserAuthBloc>();
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('isTimeOut  :${blocBloc.userAuthData.isTimeOut}'),
            Text('isError  :${blocBloc.userAuthData.isError}'),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  blocBloc.add(const UserAuthEvent.init());
                },
                child: const Text('Try again')),
          ],
        ));
  }
}
