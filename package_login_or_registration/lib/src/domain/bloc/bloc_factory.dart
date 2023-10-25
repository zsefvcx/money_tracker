
import 'package:get_it/get_it.dart';
import 'package:package_login_or_registration/src/data/data.dart';
import 'package:package_login_or_registration/src/domain/domain.dart';

class BlocFactory {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = BlocFactory();

  void initialize(){
    ServiceProvider.instance.initialize();

    _getIt.registerLazySingleton<GetUserAuthBloc>(
          () => GetUserAuthBloc(
            getUserAuthRepository: ServiceProvider.instance.get<GetUserAuthRepository>(),
            setUserAuthRepository: ServiceProvider.instance.get<SetUserAuthRepository>(),
      ),
    );
  }
}
