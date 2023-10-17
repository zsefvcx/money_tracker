
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:package_login_or_registration/package_login_or_registration.dart';
import 'package:package_login_or_registration/src/data/data_sources/get/get_user_auth_service.dart';
import 'package:package_login_or_registration/src/data/data_sources/get/get_user_auth_service_impl.dart';
import 'package:package_login_or_registration/src/data/data_sources/set/set_user_auth_service.dart';
import 'package:package_login_or_registration/src/data/data_sources/set/set_user_auth_service_impl.dart';
import 'package:package_login_or_registration/src/data/repository/get_user_auth_repository_impl.dart';
import 'package:package_login_or_registration/src/data/repository/set_user_auth_repository_impl.dart';
import 'package:package_login_or_registration/src/domain/repositories/get_user_auth_repository.dart';
import 'package:package_login_or_registration/src/domain/repositories/set_user_auth_repository.dart';

class ServiceProvider{
  static final _getIt = GetIt.I;

  final NetworkInfo networkInfo = NetworkInfoImp(internetConnectionChecker: InternetConnectionChecker());
  final GetUserAuthService getUserAuthService = GetUserAuthServiceImpl();
  final SetUserAuthService setUserAuthService = SetUserAuthServiceImpl();

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = ServiceProvider();

  void initialize(){
    _getIt..registerLazySingleton<GetUserAuthRepository>(
          () => GetUserAuthRepositoryImpl(
        networkInfo: networkInfo,
        getUserAuthService: getUserAuthService,
      ),
    )
    ..registerLazySingleton<SetUserAuthRepository>(
          () => SetUserAuthRepositoryImpl(
        networkInfo: networkInfo,
        setUserAuthService: setUserAuthService,
      ),
    );
  }
}
