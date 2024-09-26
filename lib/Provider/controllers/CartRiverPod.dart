import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:crayondcart/Models/CartModel.dart';
import 'package:crayondcart/Models/ProductsModel.dart';

class CartState {
  final List<CartItem> cartItems;
  final double grandTotal;

  CartState({
    this.cartItems = const [],
    this.grandTotal = 0.0,
  });

  CartState copyWith({
    List<CartItem>? cartItems,
    double? grandTotal,
  }) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      grandTotal: grandTotal ?? this.grandTotal,
    );
  }
}

class CartProvider extends StateNotifier<CartState> {
  CartProvider() : super(CartState());

  void addToCart(Products product, int quantity, Varients selectedVariant, int itemcount) {
    double basePrice = product.price!;
    double variantPrice = selectedVariant.price ?? 0.0;
    double totalPrice = basePrice + variantPrice;

    CartItem? existingItem = state.cartItems.firstWhere(
      (item) =>
          item.product.id == product.id &&
          item.selectedVariant?.id == selectedVariant.id,
      orElse: () => CartItem(
        product: product,
        quantity: 0,
        selectedVariant: selectedVariant,
        itemcount: 0,
        totalPrice: totalPrice,
      ),
    );

    List<CartItem> updatedCartItems = List.from(state.cartItems);
    double updatedGrandTotal = state.grandTotal;

    if (existingItem.quantity > 0) {
      // Update existing item
      final updatedItem = existingItem.copyWith(
        quantity: existingItem.quantity + quantity,
        itemcount: existingItem.itemcount! + itemcount,
        totalPrice: existingItem.totalPrice + totalPrice * quantity,
      );

      updatedCartItems[updatedCartItems.indexOf(existingItem)] = updatedItem;
      updatedGrandTotal += totalPrice * quantity;
    } else {
      // Add new item
      updatedCartItems.add(
        CartItem(
          product: product,
          quantity: quantity,
          selectedVariant: selectedVariant,
          itemcount: itemcount,
          totalPrice: totalPrice * quantity,
        ),
      );
      updatedGrandTotal += totalPrice * quantity;
    }

    state = state.copyWith(cartItems: updatedCartItems, grandTotal: updatedGrandTotal);
  }

  void removeFromCart(CartItem cartItem) {
    List<CartItem> updatedCartItems = List.from(state.cartItems);
    updatedCartItems.remove(cartItem);

    double updatedGrandTotal = state.grandTotal - cartItem.totalPrice;

    state = state.copyWith(cartItems: updatedCartItems, grandTotal: updatedGrandTotal);
  }

  void incrementCounter(int index) {
    List<CartItem> updatedCartItems = List.from(state.cartItems);
    CartItem currentItem = updatedCartItems[index];

    double itemPrice = currentItem.product.price!;
    double variantPrice = currentItem.selectedVariant?.price ?? 0.0;
    double priceToAdd = itemPrice + variantPrice;

    currentItem = currentItem.copyWith(
      itemcount: currentItem.itemcount! + 1,
      quantity: currentItem.quantity + 1,
      totalPrice: currentItem.totalPrice + priceToAdd,
    );

    updatedCartItems[index] = currentItem;

    state = state.copyWith(
      cartItems: updatedCartItems,
      grandTotal: state.grandTotal + priceToAdd,
    );
  }

  void decrementCounter(int index) {
    List<CartItem> updatedCartItems = List.from(state.cartItems);
    CartItem currentItem = updatedCartItems[index];

    double itemPrice = currentItem.product.price!;
    double variantPrice = currentItem.selectedVariant?.price ?? 0.0;
    double priceToSubtract = itemPrice + variantPrice;

    if (currentItem.itemcount! > 1) {
      currentItem = currentItem.copyWith(
        itemcount: currentItem.itemcount! - 1,
        quantity: currentItem.quantity - 1,
        totalPrice: currentItem.totalPrice - priceToSubtract,
      );

      updatedCartItems[index] = currentItem;

      state = state.copyWith(
        cartItems: updatedCartItems,
        grandTotal: state.grandTotal - priceToSubtract,
      );
    } else {
      removeFromCart(currentItem);
    }
  }
}
