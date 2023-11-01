
import 'package:get_it/get_it.dart';
import 'package:money_tracker/login_future/data/data.dart';
import 'package:money_tracker/login_future/domain/domain.dart';

class BlocFactory {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = BlocFactory();

  void initialize(){
    ServiceProvider.instance.initialize();

    _getIt.registerLazySingleton<UserAuthBloc>(
          () => UserAuthBloc(
            getUserAuthRepository: ServiceProvider.instance.get<GetUserAuthRepository>(),
            setUserAuthRepository: ServiceProvider.instance.get<SetUserAuthRepository>(),
      ),
    );
  }
}
