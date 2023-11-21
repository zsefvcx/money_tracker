
import 'package:flutter/material.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
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
    final photoBloc = MoneyTrackerBlocsInit.photoBloc;
    final dataTimeNow = DateTime.now();
    final monthCurrent = MonthCurrent(
        id: null,
        year: dataTimeNow.year,
        month: dataTimeNow.month
    );
    final monthBloc = MoneyTrackerBlocsInit.monthBloc;
    final categoriesBloc = MoneyTrackerBlocsInit.categoriesBloc;
    final statusUserProp = StatusUserProp(
      eMail: eMail,
      uuid: uuid,
      loadImage: loadImage,
      monthCurrent: monthCurrent,
    );

      monthBloc.add(MonthBlocEvent.init(
          uuid: uuid,
          data: monthCurrent)
      );

      if (loadImage){
        photoBloc.add(PhotoBlocEvent.init(uuid: uuid));
      } else {
        photoBloc.add(const PhotoBlocEvent.init(uuid: ''));
      }

      categoriesBloc.add(CategoriesBlocEvent.init(uuid: uuid));

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
      ],
      child: MainBuilderForm(
        statusUserProp: statusUserProp,
      ),
    );
  }
}
