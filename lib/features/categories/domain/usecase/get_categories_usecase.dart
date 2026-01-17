import 'package:dartz/dartz.dart';
import 'package:trust_task/core/errors/ui_errors.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/category_entity.dart';
import '../repository/categories_repository.dart';

class GetCategoriesUseCase implements UseCase<List<CategoryEntity>, NoParams> {
  final CategoriesRepository repository;
  GetCategoriesUseCase(this.repository);

  @override
  Future<Either<UiError, List<CategoryEntity>>> call(NoParams params) async {
    return await repository.getCategories();
  }
}