import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {
  Future<void> setString(String key, String value);
  String? getString(String key);
  Future<void> remove(String key);
  Future<void> clear();
}

class StorageServiceImpl implements StorageService {
  final SharedPreferences _sharedPreferences;

  StorageServiceImpl(this._sharedPreferences);

  @override
  Future<void> setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  @override
  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  @override
  Future<void> remove(String key) async {
    await _sharedPreferences.remove(key);
  }

  @override
  Future<void> clear() async {
    await _sharedPreferences.clear();
  }
}