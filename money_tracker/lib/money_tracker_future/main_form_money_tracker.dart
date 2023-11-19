
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/core/widgets/circular_progress_indicator_mod.dart';
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
    final categoriesBloc = MoneyTrackerBlocsInit.categoriesBloc
      ..add(CategoriesBlocEvent.init(uuid: uuid));
    if (loadImage){
      photoBloc.add(PhotoBlocEvent.init(uuid: uuid));
    } else {
      photoBloc.add(const PhotoBlocEvent.init(uuid: ''));
    }
    final dataTimeNow = DateTime.now();
    final monthCurrent = MonthCurrent(
        id: null,
        year: dataTimeNow.year,
        month: dataTimeNow.month
    );
    final monthBloc = MoneyTrackerBlocsInit.monthBloc..add(MonthBlocEvent.init(
        uuid: uuid,
        data: monthCurrent)
    );

    final statusUserProp = StatusUserProp(
      eMail: eMail,
      uuid: uuid,
      loadImage: loadImage,
      monthCurrent: monthCurrent,
    );

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
        ChangeNotifierProvider<StatusUserProp>(
            create: (_) => statusUserProp,
        ),
      ],
      child: SafeArea(
        child: BlocBuilder<MonthBloc, MonthBlocState>(
          builder: (context, state) {
            return state.map(
              loading: (_) =>
              const Scaffold(body: CircularProgressIndicatorMod()),
              error: (_) =>
                  Scaffold(
                    body: ErrorTimeOut<MonthBloc, MonthCurrent>(
                        uuid: statusUserProp.uuid,
                        tCurrent: statusUserProp.monthCurrent
                    ),
                  ),
              timeOut: (_) =>
                  Scaffold(
                    body: ErrorTimeOut<MonthBloc, MonthCurrent>(
                        uuid: statusUserProp.uuid,
                        tCurrent: statusUserProp.monthCurrent
                    ),
                  ),
              loaded: (value) {
                final localMonthCurrent = value.monthCurrent;
                if (localMonthCurrent == null) {
                  return Scaffold(
                    body: ErrorTimeOut<MonthBloc, MonthCurrent>(
                        uuid: statusUserProp.uuid,
                        tCurrent: statusUserProp.monthCurrent
                    ),
                  );
                }
                return const MoneyTrackerHomePage();
              },
            );
          },
        ),
      ),
    );
  }
}
