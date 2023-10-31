
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/login_future/core/core.dart';
import 'package:money_tracker/login_future/domain/domain.dart';
import 'package:money_tracker/login_future/presentation/presentation.dart';

class MainBuilderForm extends StatelessWidget {
  const MainBuilderForm({required this.loginUser, super.key});

  final bool loginUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25, right: 25, top: 10, bottom: 25,
            ),
            child: BlocBuilder<GetUserAuthBloc, UserAuthState>(
              builder: (context, state) {
                final blocBloc = context.read<GetUserAuthBloc>();
                return state.map(
                loading: (_) => const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(tag: Keys.heroIdSplash, child: MainSplash(),),
                    CircularProgressIndicator(),
                  ],
                ),
                loaded:  (_)=> MainForm(loginUserAuth: blocBloc.userAuthData.statusAuthorization),
                error:   (_)=> const ErrorTimeOut(),//
                timeOut: (_)=> const ErrorTimeOut(),
                newUser: (_)=> const MainForm(loginUserAuth: null),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
