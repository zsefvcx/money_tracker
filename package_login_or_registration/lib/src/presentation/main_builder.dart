import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_login_or_registration/src/core/core.dart';
import 'package:package_login_or_registration/src/domain/bloc/user_auth_bloc.dart';
import 'package:package_login_or_registration/src/presentation/widgets/error_time_out_widget.dart';
import 'package:package_login_or_registration/src/presentation/widgets/main_form.dart';
import 'package:package_login_or_registration/src/presentation/widgets/main_splash_widget.dart';

class MainBuilderForm extends StatelessWidget {
  const MainBuilderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserAuthBloc, UserAuthState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 10, bottom: 25,
                ),
                child: state.map(
                loading: (_) => const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(tag: Keys.heroIdSplash, child: MainSplashWidget(),),
                    CircularProgressIndicator(),
                  ],
                ),
                loaded:  (_)=> const MainForm(loginUser: true),
                error:   (_)=> const ErrorTimeOutWidget(),//
                timeOut: (_)=> const ErrorTimeOutWidget(),
                newUser: (_)=> const MainForm(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
