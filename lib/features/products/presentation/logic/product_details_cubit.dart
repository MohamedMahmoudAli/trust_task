import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/get_product_details_usecase.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  ProductDetailsCubit(this.getProductDetailsUseCase) : super(ProductDetailsInitial());

  Future<void> loadProductDetails(int productId) async {
    emit(ProductDetailsLoading());
    
    final result = await getProductDetailsUseCase(productId);
    
    result.fold(
      (failure) => emit(ProductDetailsError(failure)),
      (product) => emit(ProductDetailsLoaded(product)),
    );
  }
}