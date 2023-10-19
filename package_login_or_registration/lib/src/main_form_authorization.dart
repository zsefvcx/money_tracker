
import 'package:flutter/material.dart';
import 'package:package_login_or_registration/package_login_or_registration.dart';
import 'package:package_login_or_registration/src/domain/bloc/bloc_factory.dart';
import 'package:package_login_or_registration/src/domain/bloc/user_auth_bloc.dart';
import 'package:package_login_or_registration/src/presentation/main_builder.dart';
import 'package:provider/provider.dart';

class MainFormAuthorization extends StatefulWidget {
  const MainFormAuthorization({super.key});

  @override
  State<MainFormAuthorization> createState() => _MainFormAuthorizationState();
}

class _MainFormAuthorizationState extends State<MainFormAuthorization> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GetUserAuthBloc>(
          create: (_) => MainBlocInit.getUserAuthBloc
        ),
      ],
      child: const MainBuilderForm(),
    );
  }
}
