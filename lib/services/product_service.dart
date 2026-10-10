import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/product_model.dart';
import 'cache_helper.dart';

/// Service responsible for fetching product data from API with offline cache fallback.
class ProductService {
  final Dio _dio;
  static const String _baseUrl = 'https://fakestoreapi.com/products';

  ProductService({Dio? dio}) : _dio = dio ?? Dio();

  /// Fetches products from API.
  /// Replaces broken fakestoreapi image links with reliable Unsplash placeholder images.
  /// Falls back to local cached data if API fails or network is unavailable.
  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await _dio.get(_baseUrl);

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> jsonList = response.data as List<dynamic>;
        
        // Fix broken image URLs from FakeStoreAPI before parsing
        final List<dynamic> fixedJsonList = jsonList.map((item) {
          final map = Map<String, dynamic>.from(item as Map);
          // Hardcode a reliable image to bypass the fake store api timeouts
          map['image'] = 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1000&auto=format&fit=crop';
          return map;
        }).toList();

        // Cache the raw JSON data locally
        await CacheHelper.cacheProducts(jsonEncode(fixedJsonList));

        return fixedJsonList
            .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        return _loadFromCacheOrThrow(
            'Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Network error occurred: Attempt to load from cache
      return _loadFromCacheOrThrow('Network error: ${e.toString()}');
    }
  }

  /// Helper method to retrieve products from CacheHelper or throw exception if cache is empty.
  List<ProductModel> _loadFromCacheOrThrow(String originalErrorMessage) {
    final cachedData = CacheHelper.getCachedProducts();
    if (cachedData != null && cachedData.isNotEmpty) {
      try {
        final List<dynamic> jsonList = jsonDecode(cachedData) as List<dynamic>;
        return jsonList
            .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
            .toList();
      } catch (_) {
        throw Exception(originalErrorMessage);
      }
    }
    throw Exception(originalErrorMessage);
  }
}
