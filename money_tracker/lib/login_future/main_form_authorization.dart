
import 'package:flutter/material.dart';
import 'package:money_tracker/login_future/domain/domain.dart';
import 'package:money_tracker/login_future/main_bloc_init.dart';
import 'package:money_tracker/login_future/presentation/main_builder.dart';
import 'package:provider/provider.dart';

class MainFormAuthorization extends StatefulWidget {
  static const routeName = r'\';

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
