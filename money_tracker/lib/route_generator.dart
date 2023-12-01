
import 'package:flutter/material.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/login_future/src.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
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
        DateTime? dateTime;
        if (args != null && args is Map<String, dynamic>)  {
          final dataDateTime = args['dateTime'];
          if(dataDateTime != null && dataDateTime is DateTime){
            dateTime = dataDateTime;
          }
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
          final dataTimeNow = dateTime??DateTime.now();
          final monthCurrent = MonthCurrent(
              id: null,
              year: dataTimeNow.year,
              month: dataTimeNow.month
          );
          final statusUserProp = StatusUserProp(
            eMail: eMail,
            uuid: uuid,
            loadImage: loadImage,
            monthCurrent: monthCurrent,
          );

          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                MainFormMoneyTracker(
                    statusUserProp: statusUserProp
                ),
          );
       }
       return _errorRoute();
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
      case HomeDetailPage.routeName:
        if (args != null && args is Map<String, dynamic>)  {
          final statusUserProp = args['statusUserProp'];
          final categoryExpenses = args['categoryExpenses'];
          final dateTime = args['dateTime'];
          final updateCard = args['updateCard'];
          if(statusUserProp != null && statusUserProp is StatusUserProp
          && categoryExpenses != null && categoryExpenses is CategoryExpenses
          && dateTime != null && dateTime is DateTime
          && updateCard != null && updateCard is Future<void> Function()
          ){
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
              HomeDetailPage(
                categoryExpenses: categoryExpenses,
                statusUserProp: statusUserProp,
                dateTime: dateTime,
                updateCard: updateCard,
              ),
            );
          }
        }
        return _errorRoute();
      case MoneyTrackerHomePage.routeName:
        if (args != null && args is Map<String, dynamic>)  {
          final statusUserProp = args['StatusUserProp'];
          if(statusUserProp != null && statusUserProp is StatusUserProp){
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  MoneyTrackerHomePage(
                    statusUserProp: statusUserProp,
                  ),
            );
          }
        }



        return _errorRoute();
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
            pushReplacementNamed(MainFormAuthorization.routeName,
              // arguments: {
              //   'TabIndex':currentIndex.index,
              // },
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title[0]),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Text(S.of(context).pageNotFound),
          ),
        ),
      );
    },
      fullscreenDialog: true,
    );
  }
}
