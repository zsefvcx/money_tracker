import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_login_or_registration/src/domain/bloc/user_auth_bloc.dart';
import 'package:package_login_or_registration/src/presentation/error_time_out_widget.dart';
import 'package:package_login_or_registration/src/presentation/main_form.dart';

class MainBuilderForm extends StatefulWidget {
  const MainBuilderForm({super.key});

  @override
  State<MainBuilderForm> createState() => _MainBuilderFormState();
}

class _MainBuilderFormState extends State<MainBuilderForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserAuthBloc, UserAuthState>(
      builder: (context, state) {
        return state.map(
        loading: (_) => const Center(child: CircularProgressIndicator()),
        loaded:  (_) => const MainForm(loginUser: true),
        error:   (_)=> const ErrorTimeOutWidget(),
        timeOut: (_)=> const ErrorTimeOutWidget(),
        newUser: (_)=> const MainForm(),
        );
      },
    );
  }
}
