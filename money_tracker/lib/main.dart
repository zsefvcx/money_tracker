import 'dart:io';

import 'package:flutter/material.dart';
import 'package:money_tracker/login_future/src.dart';
import 'package:money_tracker/money_tracker_app.dart';
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
      title: 'Money Tracker',
      titleBarStyle: TitleBarStyle.normal,
    );
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  MainBlocInit.initState();

  runApp(const MoneyTrackerApp());
}
