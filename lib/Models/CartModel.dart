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
}
