import 'package:equatable/equatable.dart';
import '../../models/cart_item_model.dart';

class CartState extends Equatable {
  final List<CartItemModel> items;
  final bool isJustEmptied;

  const CartState({
    this.items = const [],
    this.isJustEmptied = false,
  });

  /// Calculates total monetary price of all items in the cart.
  double get totalPrice {
    return items.fold(0.0, (sum, item) => sum + item.itemTotalPrice);
  }

  /// Total count of individual items in the cart.
  int get totalItemCount {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  /// Copies state with optional updated items.
  CartState copyWith({
    List<CartItemModel>? items,
    bool? isJustEmptied,
  }) {
    return CartState(
      items: items ?? this.items,
      isJustEmptied: isJustEmptied ?? false,
    );
  }

  @override
  List<Object?> get props => [items, isJustEmptied];
}
