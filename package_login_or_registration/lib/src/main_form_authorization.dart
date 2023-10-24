
import 'package:flutter/material.dart';
import 'package:package_login_or_registration/src/domain/domain.dart';
import 'package:package_login_or_registration/src/main_bloc_init.dart';
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
          create: (_) => MainBloc.getUserAuthBloc
        ),
      ],
      child: const MainBuilderForm(),
    );
  }
}
