import 'dart:io';

import 'package:flutter/material.dart';
import 'package:money_tracker/login_future/src.dart';
import 'package:money_tracker/money_tracker_app.dart';
import 'package:money_tracker/money_tracker_future/src.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:window_manager/window_manager.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isMacOS   || Platform.isLinux || Platform.isWindows) {
    databaseFactory = databaseFactoryFfi;
    await windowManager.ensureInitialized();
    const windowOptions = WindowOptions(
      minimumSize: Size(375, 812),
      size: Size(375, 812),
      center: true,
      alwaysOnTop: false,
      skipTaskbar: false,
      fullScreen: false,
      backgroundColor: Colors.transparent,
      title: 'Money Tracker',
      titleBarStyle: TitleBarStyle.normal,
    );
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  LoginBlocInit.initState();
  MoneyTrackerBlocsInit.initState();

  runApp(const MoneyTrackerApp());
}
