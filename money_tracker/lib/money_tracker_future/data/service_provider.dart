import 'package:get_it/get_it.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';


class ServiceProvider{
  static final _getIt = GetIt.I;

  final PhotoFromIntFile photoFromIntFile = PhotoFromIntFileImpl();
  final MonthsStatus     monthsStatus     = MonthsStatusImpl();
  final CategoriesData   categoriesData   = CategoriesDataImpl();
  final ExpensesData     expensesData     = ExpensesDataImpl();

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = ServiceProvider();

  void initialize(){
    _getIt..registerLazySingleton<PhotoRepository>(
          () => PhotoRepositoryImpl(
        photoFromIntFile: photoFromIntFile,
      ))..registerLazySingleton<MonthRepository>(
                () => MonthRepositoryImpl(
              monthsStatus: monthsStatus,
      ))..registerLazySingleton<CategoriesRepository>(
            () => CategoriesRepositoryImpl(
              categoriesData: categoriesData
      ))..registerLazySingleton<MonthlyExpensesRepository>(
            () => MonthlyExpensesRepositoryImpl(
            expensesData: expensesData
      ));
  }
}
