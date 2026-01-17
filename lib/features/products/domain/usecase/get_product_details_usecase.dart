import 'package:dartz/dartz.dart';
import 'package:trust_task/core/errors/ui_errors.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product_details_entity.dart';
import '../repository/product_repository.dart';

class GetProductDetailsUseCase implements UseCase<ProductDetailsEntity, int> {
  final ProductRepository repository;
  GetProductDetailsUseCase(this.repository);

  @override
  Future<Either<UiError, ProductDetailsEntity>> call(int productId) async {
    return await repository.getProductDetails(productId);
  }
}