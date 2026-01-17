import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trust_task/features/products/data/data_sources/remote/product_remote_data_source.dart';
import 'package:trust_task/features/products/data/repository_imp/product_repository_imp.dart';
import 'package:trust_task/features/products/domain/repository/product_repository.dart';
import 'package:trust_task/features/products/domain/usecase/get_product_details_usecase.dart';
import 'package:trust_task/features/products/presentation/logic/product_details_cubit.dart';

// Categories Feature Imports
import '../../features/categories/data/data_sources/remote/categories_remote_data_source.dart';
import '../../features/categories/data/repository_imp/categories_repository_imp.dart';
import '../../features/categories/domain/repository/categories_repository.dart';
import '../../features/categories/domain/usecase/get_categories_usecase.dart';
import '../../features/categories/presentation/logic/categories_cubit.dart';
import '../cache/storage_service.dart';
// Core Imports
import '../network/dio_client.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  await _initCore();
  await _initCategories();
  await _initProducts(); // To be added next
  // await _initCart();     // To be added next
}

Future<void> _initCore() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Services
  sl.registerLazySingleton<StorageService>(
    () => StorageServiceImpl(sl<SharedPreferences>()),
  );

  // Network
  sl.registerLazySingleton<DioClient>(() => DioClient());
}

Future<void> _initProducts() async {
  // 1. Data Source
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImp(sl<DioClient>()),
  );

  // 2. Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImp(sl<ProductRemoteDataSource>()),
  );

  // 3. Use Case
  sl.registerLazySingleton<GetProductDetailsUseCase>(
    () => GetProductDetailsUseCase(sl<ProductRepository>()),
  );

  // 4. Cubit (Factory)
  sl.registerFactory<ProductDetailsCubit>(
    () => ProductDetailsCubit(sl<GetProductDetailsUseCase>()),
  );
}

Future<void> _initCategories() async {
  // Data sources
  sl.registerLazySingleton<CategoriesRemoteDataSource>(
    () => CategoriesRemoteDataSourceImp(sl<DioClient>()),
  );

  // Repository
  sl.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImp(sl<CategoriesRemoteDataSource>()),
  );

  // Use cases
  sl.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(sl<CategoriesRepository>()),
  );

  // Cubits
  sl.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(sl<GetCategoriesUseCase>()),
  );
}
