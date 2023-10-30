
import 'package:flutter/material.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/login_future/src.dart';
import 'package:money_tracker/money_tracker_future/src.dart';


class RouteGenerator {

  static String initialRoute = MainFormAuthorization.routeName;

  static List<String> title = ['Error', ];


  static Route<dynamic> generateRoute(RouteSettings settings){
    //final args = settings.arguments;

    switch(settings.name){
      case MoneyTrackerHomePage.routeName:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          const MoneyTrackerHomePage(),
        );
      case MainFormAuthorization.routeName:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          const MainFormAuthorization(),
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
            pushReplacementNamed(MoneyTrackerHomePage.routeName,
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
