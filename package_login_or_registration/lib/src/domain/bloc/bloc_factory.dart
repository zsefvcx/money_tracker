
import 'package:get_it/get_it.dart';
import 'package:package_login_or_registration/src/data/service_provider.dart';
import 'package:package_login_or_registration/src/domain/bloc/user_auth_bloc.dart';
import 'package:package_login_or_registration/src/domain/repositories/get_user_auth_repository.dart';
import 'package:package_login_or_registration/src/domain/repositories/set_user_auth_repository.dart';

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
