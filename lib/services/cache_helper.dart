import 'package:shared_preferences/shared_preferences.dart';

/// Helper class to handle local data caching using SharedPreferences.
class CacheHelper {
  static SharedPreferences? _preferences;
  static const String _productsKey = 'cached_products';
  static const String _themeKey = 'is_dark_theme';
  static const String _localeKey = 'app_locale';

  /// Initializes SharedPreferences instance.
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// Caches raw JSON string of product list.
  static Future<bool> cacheProducts(String jsonString) async {
    return await _preferences?.setString(_productsKey, jsonString) ?? false;
  }

  /// Retrieves cached raw JSON string of product list.
  static String? getCachedProducts() {
    return _preferences?.getString(_productsKey);
  }

  /// Saves theme preference (dark or light).
  static Future<bool> saveThemeMode(bool isDark) async {
    return await _preferences?.setBool(_themeKey, isDark) ?? false;
  }

  /// Gets saved theme preference.
  static bool? getThemeMode() {
    return _preferences?.getBool(_themeKey);
  }

  /// Saves locale preference ('en' or 'ar').
  static Future<bool> saveLocale(String languageCode) async {
    return await _preferences?.setString(_localeKey, languageCode) ?? false;
  }

  /// Gets saved locale preference code.
  static String? getLocale() {
    return _preferences?.getString(_localeKey);
  }
}
