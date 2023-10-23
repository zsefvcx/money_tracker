import 'dart:io';

import 'package:example/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:package_login_or_registration/package_login_or_registration.dart' as login;
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isMacOS   || Platform.isLinux || Platform.isWindows) {
    await windowManager.ensureInitialized();
    const windowOptions = WindowOptions(
      minimumSize: Size(375, 812),
      size: Size(375, 812),
      center: true,
      alwaysOnTop: false,
      skipTaskbar: false,
      fullScreen: false,
      backgroundColor: Colors.transparent,
      title: 'Store',
      titleBarStyle: TitleBarStyle.normal,
    );
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  login.MainBlocInit.initState();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: login.themeMainProgram,
      localizationsDelegates: const [
        S.delegate,
        login.S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('en'),
      initialRoute: RouteGenerator.initialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class RouteGenerator {

  static String initialRoute = MyHomePage.routeName;

  static List<String> title = ['Error', ];


  static Route<dynamic> generateRoute(RouteSettings settings){
    //final args = settings.arguments;

    switch(settings.name){
      case MyHomePage.routeName:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MyHomePage(),
        );
      case MainPageExpenses.routeName:
         return PageRouteBuilder(
           pageBuilder: (context, animation, secondaryAnimation) =>
               const MainPageExpenses(),
      );
    //case HotelView.routeName:
    // if(args != null && args is Map<String, HotelPreview>){
    //   if(args['hotel']!=null){
    //     HotelPreview data = args['hotel'] as HotelPreview;
    //     return PageRouteBuilder(
    //       pageBuilder:(context, animation, secondaryAnimation) =>
    //           HotelView(hotel: data,),
    //     );
    //   } else {
    //     return _errorRoute();
    //   }
    // } else {
    //   return _errorRoute();
    // }
    //  return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    //currentIndex.index = 0;
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(icon: const Icon(Icons.close),
            onPressed: ()=>Navigator.of(context).
            pushReplacementNamed(MainPageExpenses.routeName,
              // arguments: {
              //   'TabIndex':currentIndex.index,
              // },
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title[0]),
          centerTitle: true,
        ),
        body: Center(
          child: Text(S.of(context).pageNotFound),
        ),
      );
    },
      fullscreenDialog: true,
    );
  }
}

class MainPageExpenses extends StatelessWidget {
  static const routeName = r'\PageExpenses';

  const MainPageExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(DateTime.now().toString()),
            centerTitle: true,
            leading: const Icon(Icons.add),
          ),
          body: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 25),
              child: Placeholder(),
          ),
          bottomSheet: BottomAppBar(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  children: [
                    const Icon(Icons.credit_card),
                    Text(S.of(context).expenses),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Column(
                  children: [
                    const Icon(Icons.person),
                    Text(S.of(context).profile),
                  ],
                ),
              ),
            ],
          )),
        ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  static const routeName = r'\';

  const MyHomePage({ super.key});

  @override
  Widget build(BuildContext context) {
    return const login.MainFormAuthorization();
  }
}
