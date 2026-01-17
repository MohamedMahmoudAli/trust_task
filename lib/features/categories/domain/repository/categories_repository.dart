import 'package:dartz/dartz.dart';
import 'package:trust_task/core/errors/ui_errors.dart';
import '../entities/category_entity.dart';

abstract class CategoriesRepository {
  Future<Either<UiError, List<CategoryEntity>>> getCategories();
}