import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';
import '../../models/cart_item_model.dart';

/// BLoC managing shopping cart logic: adding, removing, clearing items and calculating total price.
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddToCartEvent>(_onAddToCart);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
    on<ClearCartEvent>(_onClearCart);
  }

  void _onAddToCart(AddToCartEvent event, Emitter<CartState> emit) {
    final updatedList = List<CartItemModel>.from(state.items);
    final existingIndex = updatedList.indexWhere(
      (item) => item.product.id == event.product.id,
    );

    if (existingIndex >= 0) {
      final existingItem = updatedList[existingIndex];
      updatedList[existingIndex] = existingItem.copyWith(
        quantity: existingItem.quantity + 1,
      );
    } else {
      updatedList.add(CartItemModel(product: event.product, quantity: 1));
    }

    emit(state.copyWith(items: updatedList, isJustEmptied: false));
  }

  void _onRemoveFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) {
    final updatedList = List<CartItemModel>.from(state.items);
    final existingIndex = updatedList.indexWhere(
      (item) => item.product.id == event.product.id,
    );

    if (existingIndex >= 0) {
      final existingItem = updatedList[existingIndex];
      if (existingItem.quantity > 1) {
        updatedList[existingIndex] = existingItem.copyWith(
          quantity: existingItem.quantity - 1,
        );
        emit(state.copyWith(items: updatedList, isJustEmptied: false));
      } else {
        updatedList.removeAt(existingIndex);
        final bool isNowEmpty = updatedList.isEmpty;
        emit(state.copyWith(items: updatedList, isJustEmptied: isNowEmpty));
      }
    }
  }

  void _onClearCart(ClearCartEvent event, Emitter<CartState> emit) {
    final bool wasNotEmpty = state.items.isNotEmpty;
    emit(state.copyWith(items: [], isJustEmptied: wasNotEmpty));
  }
}
