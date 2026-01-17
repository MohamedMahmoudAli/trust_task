import 'package:dartz/dartz.dart';
import 'package:trust_task/core/errors/ui_errors.dart';
import '../entities/product_details_entity.dart';

abstract class ProductRepository {
  Future<Either<UiError, ProductDetailsEntity>> getProductDetails(int productId);
}