
import 'package:flutter/material.dart';
import 'package:money_tracker/login_future/domain/domain.dart';
import 'package:money_tracker/login_future/login_bloc_init.dart';
import 'package:money_tracker/login_future/presentation/main_builder.dart';
import 'package:provider/provider.dart';

class MainFormAuthorization extends StatelessWidget {
  static const routeName = r'\';

  const MainFormAuthorization({required this.loginUser, super.key});

  final bool loginUser;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserAuthBloc>(
          create: (_) => LoginBlocInit.getUserAuthBloc
        ),
      ],
      child: MainBuilderForm(loginUser: loginUser),
    );
  }
}
