
part of 'categories_bloc.dart';

@freezed
class CategoriesBlocState with _$CategoriesBlocState{
  const factory CategoriesBlocState.loading() = _loadingState;
  const factory CategoriesBlocState.loaded({required CategoriesExpensesModels? model,}) = _loadedState;
  const factory CategoriesBlocState.error() = _errorState;
  const factory CategoriesBlocState.timeOut() = _timeOut;
}
