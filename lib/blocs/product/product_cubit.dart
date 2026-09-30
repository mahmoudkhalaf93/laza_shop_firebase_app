import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/product_service.dart';
import 'product_state.dart';

/// Cubit managing loading, fetched, and error states for products.
class ProductCubit extends Cubit<ProductState> {
  final ProductService productService;

  ProductCubit({required this.productService}) : super(ProductInitial());

  /// Fetches products from API or local cache.
  Future<void> fetchProducts() async {
    emit(ProductLoading());
    try {
      final products = await productService.fetchProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString().replaceAll('Exception: ', '')));
    }
  }
}
