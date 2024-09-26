// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crayondcart/Models/ProductsModel.dart';

class CartItem {
  Products product;
  int quantity;
  Varients? selectedVariant;
  int? itemcount;
  double totalPrice;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.selectedVariant,
    this.itemcount = 1,
    required this.totalPrice,
  });

  CartItem copyWith({
    Products? product,
    int? quantity,
    Varients? selectedVariant,
    int? itemcount,
    double? totalPrice,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedVariant: selectedVariant ?? this.selectedVariant,
      itemcount: itemcount ?? this.itemcount,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
