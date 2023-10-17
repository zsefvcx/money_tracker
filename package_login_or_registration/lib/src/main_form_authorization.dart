import 'dart:async';

import 'package:flutter/material.dart';
import 'package:package_login_or_registration/src/domain/bloc/bloc_factory.dart';
import 'package:package_login_or_registration/src/domain/bloc/user_auth_bloc.dart';
import 'package:package_login_or_registration/src/presentation/main_builder.dart';
import 'package:package_login_or_registration/src/presentation/main_form.dart';
import 'package:provider/provider.dart';

class MainFormAuthorization extends StatefulWidget {
  const MainFormAuthorization({super.key});

  @override
  State<MainFormAuthorization> createState() => _MainFormAuthorizationState();
}

class _MainFormAuthorizationState extends State<MainFormAuthorization> {
  late final GetUserAuthBloc _getUserAuthBloc;

  @override
  void initState() {
    super.initState();
    BlocFactory.instance.initialize();
    _getUserAuthBloc = BlocFactory.instance.get<GetUserAuthBloc>();
    _getUserAuthBloc.add(const UserAuthEvent.init());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GetUserAuthBloc>(
          create: (_) => _getUserAuthBloc
        ),
      ],
      child: const MainBuilderForm(),
    );
  }
}
