
import 'package:get_it/get_it.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

class BlocFactory {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = BlocFactory();

  void initialize(){
    ServiceProvider.instance.initialize();
    _getIt..registerLazySingleton<PhotoBloc>(
          () => PhotoBloc(
        photoRepository: ServiceProvider.instance.get<PhotoRepository>(),
      ),
    )..registerLazySingleton<MonthBloc>(
          () => MonthBloc(
        monthRepository: ServiceProvider.instance.get<MonthRepository>(),
      ),
    );
  }
}
