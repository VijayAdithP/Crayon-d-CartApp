import 'package:crayondcart/Models/CartModel.dart';
import 'package:crayondcart/Provider/CartProvider.dart';
import 'package:flutter/material.dart';

class CartItems extends StatefulWidget {
  final CartProvider cart;
  final Function decrementCounter;
  final Function incrementCounter;
  int? itemCount;
  double? totalPrice;

  CartItems(
      {super.key,
      required this.cart,
      required this.decrementCounter,
      required this.incrementCounter,
      required this.itemCount,
      required this.totalPrice});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.cart.cartItems.length,
      itemBuilder: (context, index) {
        CartItem currentItem = widget.cart.cartItems[index];
        // widget.itemCount = widget.cart.cartItems[index].itemcount!;

        final item = widget.cart.cartItems[index];

        // widget.totalPrice = (widget.cart.cartItems[index].product.price! *
        //         widget.cart.cartItems[index].itemcount!) +
        //     item.selectedVariant!.price!;
        return Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.product.name}',
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${item.selectedVariant!.name}',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: Colors.grey[500]!,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 3,
                              horizontal: 5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    widget.decrementCounter(index);
                                  },
                                  child: const Icon(Icons.remove),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  currentItem.itemcount.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    widget.incrementCounter(index);
                                  },
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          currentItem.totalPrice.toStringAsFixed(2),
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (index != widget.cart.cartItems.length - 1)
              Divider(
                color: Colors.grey[400],
                thickness: 1,
                height: 0,
              ),
          ],
        );
      },
    );
  }
}
