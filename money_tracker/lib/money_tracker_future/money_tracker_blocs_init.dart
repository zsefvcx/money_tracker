
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';

class MoneyTrackerBlocsInit {
  static late final PhotoBloc photoBloc;
  static late final MonthBloc monthBloc;
  static late final CategoriesBloc categoriesBloc;


  static void initState() {
    BlocFactory.instance.initialize();
    photoBloc = BlocFactory.instance.get<PhotoBloc>();
    monthBloc = BlocFactory.instance.get<MonthBloc>();
    categoriesBloc = BlocFactory.instance.get<CategoriesBloc>();
    //final photoBloc = context.read<PhotoBloc>();
    //final categoriesBloc = context.read<CategoriesBloc>();
    // if(_tabController.index == 0) {
    //   _currentTabIndex = 0;
    //   categoriesBloc.add(CategoriesBlocEvent.init(uuid: widget.uuid));
    // } else if(_tabController.index == 1){
    //   _currentTabIndex = 1;
    //   if (widget.loadImage){
    //     photoBloc.add(PhotoBlocEvent.init(uuid: widget.uuid));
    //   } else {
    //     photoBloc.add(const PhotoBlocEvent.init(uuid: ''));
    //   }
    // }
  }

}
