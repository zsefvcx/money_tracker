
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/main_theme_data.dart';
import 'package:money_tracker/route_generator.dart';

class MoneyTrackerApp extends StatelessWidget {
  const MoneyTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Tracker',
      debugShowCheckedModeBanner: false,
      theme: themeMainProgram,
      scrollBehavior: const MaterialScrollBehavior()
        .copyWith(dragDevices: {...PointerDeviceKind.values}),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      //locale: const Locale('en'),
      initialRoute: RouteGenerator.initialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
