import 'package:crayondcart/Provider/controllers/CartRiverPod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartProvider, CartState>((ref) {
  return CartProvider();
});
