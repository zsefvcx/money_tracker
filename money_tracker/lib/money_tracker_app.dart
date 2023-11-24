
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/main_theme_data.dart';
import 'package:money_tracker/money_tracker_future/src.dart';
import 'package:money_tracker/route_generator.dart';
import 'package:provider/provider.dart';

class MoneyTrackerApp extends StatelessWidget {
  const MoneyTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final photoBloc = MoneyTrackerBlocsInit.photoBloc;
    final monthBloc = MoneyTrackerBlocsInit.monthBloc;
    final categoriesBloc = MoneyTrackerBlocsInit.categoriesBloc;
    final monthlyExpensesBloc = MoneyTrackerBlocsInit.monthlyExpensesBloc;

    return MultiProvider(
      providers: [
        Provider<PhotoBloc>(
          create: (_) => photoBloc,
        ),
        Provider<MonthBloc>(
          create: (_) => monthBloc,
        ),
        Provider<CategoriesBloc>(
          create: (_) => categoriesBloc,
        ),
        Provider<MonthlyExpensesBloc>(
          create: (_) => monthlyExpensesBloc,
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
