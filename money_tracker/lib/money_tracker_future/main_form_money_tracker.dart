
import 'package:flutter/material.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:money_tracker/money_tracker_future/src.dart';
import 'package:provider/provider.dart';

class MainFormMoneyTracker extends StatelessWidget {
  static const routeName = r'\PageMoneyTracker';

  const MainFormMoneyTracker({
    required this.loadImage,
    required this.uuid,
    required this.eMail,
    super.key
  });

  final String uuid;
  final String eMail;
  final bool loadImage;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PhotoBloc>(
            create: (_) => MoneyTrackerBlocsInit.photoBloc,
        ),
      ],
      child: MoneyTrackerHomePage(uuid: uuid, eMail: eMail, loadImage: loadImage,),
    );
  }
}
