import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecase/get_categories_usecase.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoriesCubit(this.getCategoriesUseCase) : super(CategoriesInitial());

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());
    final result = await getCategoriesUseCase(NoParams());
    result.fold(
      (error) => emit(CategoriesError(error)),
      (categories) => emit(CategoriesLoaded(categories)),
    );
  }
}