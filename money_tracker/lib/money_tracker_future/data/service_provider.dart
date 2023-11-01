import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:money_tracker/login_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';


class ServiceProvider{
  static final _getIt = GetIt.I;

  final NetworkInfo networkInfo = NetworkInfoImp(internetConnectionChecker: InternetConnectionChecker());
  final PhotoReadFromIntFile photoReadFromIntFile = PhotoReadFromIntFileImpl();

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = ServiceProvider();

  void initialize(){
    _getIt.registerLazySingleton<PhotoReadRepository>(
          () => PhotoReadRepositoryImpl(
        networkInfo: networkInfo,
        photoReadFromIntFile: photoReadFromIntFile,
      ),
    );
  }
}
