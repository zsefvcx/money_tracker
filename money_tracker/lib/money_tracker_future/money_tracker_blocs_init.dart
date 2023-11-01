
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';

class MoneyTrackerBlocsInit {
  static late final PhotoBloc photoBloc;

  static void initState() {
    BlocFactory.instance.initialize();
    photoBloc = BlocFactory.instance.get<PhotoBloc>();

  }

  static void init({required String uuid}){
    photoBloc.add(PhotoBlocEvent.init(uuid: uuid));
  }

}
