
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/login_future/domain/domain.dart';
import 'package:money_tracker/login_future/login_bloc_init.dart';
import 'package:money_tracker/login_future/presentation/presentation.dart';
import 'package:provider/provider.dart';

class MainFormAuthorization extends StatelessWidget {
  static const routeName = r'\';

  const MainFormAuthorization({required this.loginUser, super.key});

  final bool loginUser;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MultiProvider(
      providers: [
        Provider<UserAuthBloc>(
          create: (_) => LoginBlocInit.getUserAuthBloc
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25, right: 25, top: 10, bottom: 25,
              ),
              child: BlocBuilder<UserAuthBloc, UserAuthState>(
                builder: (context, state) {
                  final blocBloc = context.read<UserAuthBloc>();
                  return state.map(
                    loading: (_) => const CircularProgressIndicatorMod(),
                    loaded:  (_)=> MainForm(
                      loginUserAuth: blocBloc.modelData.statusAuthorization,
                      eMail: blocBloc.modelData.eMail,
                      uuid: blocBloc.modelData.uuid,
                      loadImage: blocBloc.modelData.loadImage,
                      valueLoginProcess: false,
                    ),
                    error:   (_)=> const ErrorTimeOut<UserAuthBloc, UserAuthorizationPasswordEntity>(),
                    timeOut: (_)=> const ErrorTimeOut<UserAuthBloc, UserAuthorizationPasswordEntity>(),
                    newUser: (_)=> const MainForm(
                      loginUserAuth: null,
                      eMail: null,
                      uuid: null,
                      loadImage: false,
                      valueLoginProcess: true,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
