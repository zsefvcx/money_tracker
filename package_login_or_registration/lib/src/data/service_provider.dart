
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:package_login_or_registration/src/core/core.dart';
import 'package:package_login_or_registration/src/data/data.dart';
import 'package:package_login_or_registration/src/domain/domain.dart';

class ServiceProvider{
  static final _getIt = GetIt.I;

  final NetworkInfo networkInfo = NetworkInfoImp(internetConnectionChecker: InternetConnectionChecker());

  static final SecureStorage secureStorage = SecureStorageImpl(storage: const FlutterSecureStorage(aOptions: AndroidOptions(
  encryptedSharedPreferences: true,
  )));

  final GetUserAuthService getUserAuthService = GetUserAuthServiceImpl(secureStorage: secureStorage);
  final SetUserAuthService setUserAuthService = SetUserAuthServiceImpl(secureStorage: secureStorage);

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
