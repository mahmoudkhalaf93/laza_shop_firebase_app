import 'package:equatable/equatable.dart';
import '../../models/product_model.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

/// Event dispatched when adding a product to the cart.
class AddToCartEvent extends CartEvent {
  final ProductModel product;

  const AddToCartEvent(this.product);

  @override
  List<Object?> get props => [product];
}

/// Event dispatched when removing a product from the cart.
class RemoveFromCartEvent extends CartEvent {
  final ProductModel product;

  const RemoveFromCartEvent(this.product);

  @override
  List<Object?> get props => [product];
}

/// Event dispatched to clear all items in the cart.
class ClearCartEvent extends CartEvent {
  const ClearCartEvent();
}
