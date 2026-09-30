import 'package:equatable/equatable.dart';
import 'product_model.dart';

/// Data model representing an item in the shopping cart with quantity.
class CartItemModel extends Equatable {
  final ProductModel product;
  final int quantity;

  const CartItemModel({
    required this.product,
    this.quantity = 1,
  });

  /// Total price for this cart item line.
  double get itemTotalPrice => product.price * quantity;

  /// Creates a copy with optional parameter updates.
  CartItemModel copyWith({
    ProductModel? product,
    int? quantity,
  }) {
    return CartItemModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  /// Factory constructor to parse JSON map.
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int? ?? 1,
    );
  }

  /// Converts CartItemModel to JSON map.
  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  @override
  List<Object?> get props => [product, quantity];
}
