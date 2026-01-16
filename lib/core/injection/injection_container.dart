import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trust_task/core/cache/storage_service.dart';
import 'package:trust_task/core/network/dio_client.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  await _initCore();
  await _initCategories();
  await _initProducts();
  await _initCart();
}

// 1. Categories Feature
Future<void> _initCategories() async {
  // Cubit
  
  // Use Cases
  
  // Repository
 

  // Data Sources

  
}
Future<void> _initCore() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefs);
  sl.registerLazySingleton<StorageService>(() => StorageServiceImpl(sl()));
  sl.registerLazySingleton<DioClient>(() => DioClient());
}
// 2. Product Details Feature
Future<void> _initProducts() async {
  // Cubit
 
  // Use Cases
  
  // Repository
  
  // Data Sources
}

// 3. Cart Feature (Global State)
Future<void> _initCart() async {
  // Cubit - Usually a Singleton if the cart must persist across all screens
  // 

}