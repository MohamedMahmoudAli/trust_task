import 'package:trust_task/core/errors/ui_errors.dart';
import '../../domain/entities/product_details_entity.dart';

sealed class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final ProductDetailsEntity product;
  
  ProductDetailsLoaded(this.product);
}

class ProductDetailsError extends ProductDetailsState {
  final UiError error;

  ProductDetailsError(this.error);
}