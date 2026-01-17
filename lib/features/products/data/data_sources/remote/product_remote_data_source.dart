import 'package:trust_task/core/constants/api_constants.dart';
import 'package:trust_task/core/errors/exceptions.dart';
import 'package:trust_task/core/network/dio_client.dart';
import 'package:trust_task/features/products/data/models/product_model.dart';


abstract class ProductRemoteDataSource {
  Future<ProductModel> getProductDetails(int productId);
}

class ProductRemoteDataSourceImp implements ProductRemoteDataSource {
  final DioClient dioClient;
  ProductRemoteDataSourceImp(this.dioClient);

  @override
  Future<ProductModel> getProductDetails(int productId) async {
    try {
      // 1. Fetch Product Details
      final productResponse = await dioClient.get(
        ApiConstants.productDetails,
        queryParameters: {'product_id': productId},
      );

      // 2. Fetch Addons
      final addonResponse = await dioClient.get(
        ApiConstants.productAddons,
        queryParameters: {'product_id2': productId},
      );

      final List<AddonModel> addons = (addonResponse.data as List)
          .map((json) => AddonModel.fromJson(json))
          .toList();

      return ProductModel.fromJson(productResponse.data, addons);
    } on AppException {
      rethrow;
    } catch (e) {
      throw const UnknownException();
    }
  }
}