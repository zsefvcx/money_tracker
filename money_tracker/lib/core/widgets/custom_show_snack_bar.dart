
import 'package:flutter/material.dart';
import 'package:money_tracker/generated/l10n.dart';

class CustomShowSnackBar {

  static void showSnackBar(String massage, BuildContext context){
    final snackBar = SnackBar(
      content: Text(massage),
      action: SnackBarAction(
        label: S.of(context).ok,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
