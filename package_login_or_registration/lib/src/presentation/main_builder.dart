import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_login_or_registration/src/core/core.dart';
import 'package:package_login_or_registration/src/domain/domain.dart';
import 'package:package_login_or_registration/src/presentation/presentation.dart';

class MainBuilderForm extends StatelessWidget {
  const MainBuilderForm({super.key});

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
                return state.map(
                loading: (_) => const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(tag: Keys.heroIdSplash, child: MainSplash(),),
                    CircularProgressIndicator(),
                  ],
                ),
                loaded:  (_)=> const MainForm(loginUser: true),
                error:   (_)=> const ErrorTimeOut(),//
                timeOut: (_)=> const ErrorTimeOut(),
                newUser: (_)=> const MainForm(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
