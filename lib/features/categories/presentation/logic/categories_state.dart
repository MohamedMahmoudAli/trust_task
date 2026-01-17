import 'package:trust_task/core/errors/ui_errors.dart';

import '../../domain/entities/category_entity.dart';

sealed class CategoriesState {}

class CategoriesInitial extends CategoriesState {}
class CategoriesLoading extends CategoriesState {}
class CategoriesLoaded extends CategoriesState {
  final List<CategoryEntity> categories;
  CategoriesLoaded(this.categories);
}
class CategoriesError extends CategoriesState {
  final UiError error;
  CategoriesError(this.error);
}