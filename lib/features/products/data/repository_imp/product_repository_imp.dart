import 'package:dartz/dartz.dart';
import 'package:trust_task/core/errors/error_mapper.dart';
import 'package:trust_task/core/errors/exceptions.dart';
import 'package:trust_task/core/errors/ui_errors.dart';

import '../../domain/entities/product_details_entity.dart';
import '../../domain/repository/product_repository.dart';
import '../data_sources/remote/product_remote_data_source.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  ProductRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<UiError, ProductDetailsEntity>> getProductDetails(int productId) async {
    try {
      final result = await remoteDataSource.getProductDetails(productId);
      return Right(result);
    } on AppException catch (e) {
      return Left(e.toUiError());
    }
  }
}