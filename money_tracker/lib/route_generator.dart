
import 'package:flutter/material.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/login_future/src.dart';
import 'package:money_tracker/money_tracker_future/src.dart';


class RouteGenerator {

  static String initialRoute = MainFormAuthorization.routeName;

  static List<String> title = ['Error',];


  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case MainFormMoneyTracker.routeName:
        //var loginUser = false;
        var eMail = '';
        var uuid = '';
        var loadImage = false;
        if (args != null && args is Map<String, dynamic>)  {
          // final dataLoginUser = args['loginUser'];
          // if(dataLoginUser!=null && dataLoginUser is bool ){
          //   loginUser = dataLoginUser;
          // }
          final dataUuid = args['uuid'];
          if(dataUuid!=null && dataUuid is String){
            uuid = dataUuid;
          }
          final dataEMail = args['eMail'];
          if(dataEMail!=null && dataEMail is String){
            eMail = dataEMail;
          }
          final dataLoadImage = args['loadImage'];
          if(dataLoadImage!=null && dataLoadImage is bool){
            loadImage = dataLoadImage;
          }
          //'loadImage' : blocBloc.userAuthData.loadImage,
        }
        MoneyTrackerBlocsInit.init(uuid: uuid);
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              MainFormMoneyTracker(
                eMail: eMail,
                uuid: uuid,
                loadImage: loadImage,
              ),
        );
      case MainFormAuthorization.routeName:
        var loginUser = false;
        if (args != null && args is Map<String, bool>)  {
          if(args['loginUser']!=null){
            final data = args['loginUser'];
            loginUser = data ?? false;
          }
        }

        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          MainFormAuthorization(loginUser: loginUser),
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
            pushReplacementNamed(MainFormMoneyTracker.routeName,
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
