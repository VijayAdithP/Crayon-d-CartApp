import 'package:crayondcart/Models/CartModel.dart';
import 'package:crayondcart/Models/ProductsModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;
  void addToCart(
      Products product, int quantity, Varients selectedVariant, int itemcount) {
    double basePrice = product.price!;
    double variantPrice = selectedVariant.price ?? 0.0;
    double totalPrice = basePrice + variantPrice;

    CartItem? existingItem = _cartItems.firstWhere(
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

    if (existingItem.quantity > 0) {
      existingItem.quantity += quantity;
      existingItem.itemcount = existingItem.itemcount! + itemcount;
      existingItem.totalPrice += totalPrice * quantity;
    } else {
      _cartItems.add(
        CartItem(
          product: product,
          quantity: quantity,
          selectedVariant: selectedVariant,
          itemcount: itemcount,
          totalPrice: totalPrice * quantity,
        ),
      );
    }

    notifyListeners();
  }

  // void addToCart(
  //     Products product, int quantity, Varients selectedVariant, int itemcount) {
  //   CartItem? existingItem = _cartItems.firstWhere(
  //     (item) =>
  //         item.product.id == product.id &&
  //         item.selectedVariant?.id == selectedVariant.id,
  //     orElse: () => CartItem(
  //       product: product,
  //       quantity: 0,
  //       selectedVariant: selectedVariant,
  //       itemcount: 0,
  //     ),
  //   );

  //   if (existingItem.quantity > 0) {
  //     existingItem.quantity += quantity;
  //     existingItem.itemcount = existingItem.itemcount! + itemcount;
  //   } else {
  //     _cartItems.add(
  //       CartItem(
  //         product: product,
  //         quantity: quantity,
  //         selectedVariant: selectedVariant,
  //         itemcount: itemcount,
  //       ),
  //     );
  //   }

  //   notifyListeners();
  // }

  void removeFromCart(CartItem cartItem) {
    _cartItems.remove(cartItem);
    notifyListeners();
  }
}
