import 'package:dartz/dartz.dart';
import 'package:trust_task/core/errors/error_mapper.dart';
import 'package:trust_task/core/errors/exceptions.dart';
import 'package:trust_task/core/errors/ui_errors.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repository/categories_repository.dart';
import '../data_sources/remote/categories_remote_data_source.dart';

class CategoriesRepositoryImp implements CategoriesRepository {
  final CategoriesRemoteDataSource remoteDataSource;
  CategoriesRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<UiError, List<CategoryEntity>>> getCategories() async {
    try {
      final remoteData = await remoteDataSource.getCategories();
      return Right(remoteData);
    } on AppException catch (e) {
      return Left(e.toUiError());
    }
  }
}