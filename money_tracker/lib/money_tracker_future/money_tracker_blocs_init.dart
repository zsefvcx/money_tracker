
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';

class MoneyTrackerBlocsInit {
  static late final PhotoBloc photoBloc;
  static late final MonthBloc monthBloc;

  static void initState() {
    BlocFactory.instance.initialize();
    photoBloc = BlocFactory.instance.get<PhotoBloc>();
    monthBloc = BlocFactory.instance.get<MonthBloc>();
  }

}
