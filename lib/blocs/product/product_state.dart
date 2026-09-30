import 'package:equatable/equatable.dart';
import '../../models/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

/// Initial product state.
class ProductInitial extends ProductState {}

/// Loading product state.
class ProductLoading extends ProductState {}

/// Loaded product state containing fetched product list.
class ProductLoaded extends ProductState {
  final List<ProductModel> products;

  const ProductLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

/// Error state containing user-friendly error message.
class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
