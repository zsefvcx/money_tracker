
import 'package:flutter/material.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';

class StatusUserProp extends ChangeNotifier{

  String uuid;
  String eMail;
  bool loadImage;
  MonthCurrent monthCurrent;

  void notify(){
    notifyListeners();
  }


  StatusUserProp({
    required this.uuid,
    required this.eMail,
    required this.loadImage,
    required this.monthCurrent
  });




  @override
  String toString() {
    return 'StatusUserProp: {$uuid, $eMail, $loadImage, $monthCurrent}';
  }
}
