import 'package:trust_task/core/constants/api_constants.dart';
import 'package:trust_task/core/errors/exceptions.dart';
import 'package:trust_task/core/network/dio_client.dart';
import 'package:trust_task/features/categories/data/models/category_model.dart';


abstract class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoriesRemoteDataSourceImp implements CategoriesRemoteDataSource {
  final DioClient dioClient;
  CategoriesRemoteDataSourceImp(this.dioClient);

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await dioClient.get(ApiConstants.categories);
      return (response.data as List)
          .map((json) => CategoryModel.fromJson(json))
          .toList();
    } on AppException {
      rethrow;
    } catch (e) {
      throw const UnknownException();
    }
  }
}