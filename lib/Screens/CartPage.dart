import 'package:crayondcart/Components/CartPage/CartItem.dart';
import 'package:crayondcart/Components/CartPage/CartSearchBar.dart';
import 'package:crayondcart/Components/CartPage/CartSummary_Card.dart';
import 'package:crayondcart/Components/CartPage/EmptyCart.dart';
import 'package:crayondcart/Components/CartPage/NotificationBell.dart';
import 'package:crayondcart/Components/CartPage/ProfileCard.dart';
import 'package:crayondcart/Components/GlobalComponents/Dot.dart';
import 'package:crayondcart/Components/GlobalComponents/OrderId.dart';
import 'package:crayondcart/Components/GlobalComponents/Tables.dart';
import 'package:crayondcart/Provider/CartProvider.dart';
// import 'package:crayondcart/Provider/controllers/CartRiverPod.dart';
import 'package:crayondcart/Screens/PaymentSummary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  int? itemCount;
  double? totalPrice;
  // late CartProvider _cartState;

  @override
  Widget build(BuildContext context) {
    // _cartState = ref.watch(cartProvider.notifier);
    final cartState = ref.watch(cartProvider);
    // var cart = Provider.of<CartProvider>(context);

    // void incrementCounter(int index) {
    //   setState(() {
    //     CartItem currentItem = cart.cartItems[index];

    //     currentItem.itemcount = currentItem.itemcount! + 1;
    //     currentItem.quantity += 1;

    //     double itemPrice = currentItem.product.price!;
    //     double variantPrice = currentItem.selectedVariant?.price ?? 0.0;

    //     currentItem.totalPrice += (itemPrice + variantPrice);
    //   });
    // }

    // void decrementCounter(int index) {
    //   setState(() {
    //     CartItem currentItem = cart.cartItems[index];

    //     if (currentItem.itemcount! > 1) {
    //       currentItem.itemcount = currentItem.itemcount! - 1;
    //       currentItem.quantity -= 1;

    //       double itemPrice = currentItem.product.price!;
    //       double variantPrice = currentItem.selectedVariant?.price ?? 0.0;

    //       currentItem.totalPrice -= (itemPrice + variantPrice);
    //     } else {
    //       cart.removeFromCart(currentItem);
    //     }
    //   });
    // }

    double grandTotal = 0.0;
    for (var item in cartState.cartItems) {
      grandTotal += item.totalPrice;
    }
    // for (var item in cart.cartItems) {
    //   grandTotal += (item.product.price! * item.itemcount!) +
    //       item.selectedVariant!.price!;
    // }

    return Scaffold(
      backgroundColor: HexColor("#e5e5e5"),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: HexColor("#052437"),
        title: const Text(
          "Sales",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leadingWidth: 35,
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 15,
          ),
          child: Icon(
            Icons.menu,
            size: 30,
          ),
        ),
        actions: const [
          NotificationBell(),
          SizedBox(
            width: 20,
          ),
          ProfileCard(),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CartSearchbar(),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/CatalogPage',
                            );
                          },
                          child: Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: HexColor("#e5e5e5"),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              border: Border.all(
                                color: Colors.grey[500]!,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 40,
                                  child: Image.asset(
                                    fit: BoxFit.cover,
                                    "assets/img/catalog_logo.png",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cart Summary",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const HeaderText(
                                text1: 'Order ID: ',
                                text2: '0000001',
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              CartSummaryCards(
                                icon: Icons.table_restaurant_outlined,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CartSummaryCards(
                                icon: Icons.more_vert,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          TablesWidget(
                            data: "Table 1",
                            icon: Icons.table_restaurant_outlined,
                          ),
                          Dot(),
                          TablesWidget(
                            data: "Sam Richard",
                            icon: Icons.person_pin_circle_outlined,
                          ),
                          Dot(),
                          TablesWidget(
                            data: "Mark",
                            icon: Icons.person_3_outlined,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: HexColor("#e5e5e5"),
                  border: cartState.cartItems.isEmpty
                      ? null
                      : Border(
                          bottom: BorderSide(
                            color: Colors.grey[400]!,
                          ),
                        ),
                  boxShadow: [
                    cartState.cartItems.isEmpty
                        ? const BoxShadow(
                            color: Color.fromARGB(20, 0, 0, 0),
                            blurRadius: 10,
                          )
                        : const BoxShadow(
                            color: Color.fromARGB(20, 0, 0, 0),
                            blurRadius: 10,
                            offset: Offset(0, -5),
                          ),
                  ],
                ),
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.end,
                        textDirection: TextDirection.ltr,
                        softWrap: true,
                        maxLines: 1,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Item ",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Qty & Amount (SAR)",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: cartState.cartItems.isEmpty
                      ? const EmptyCart()
                      : CartItems(
                          cart: cartState,
                          // decrementCounter: _cartState.decrementCounter,
                          // incrementCounter: _cartState.incrementCounter,
                          itemCount: itemCount,
                          totalPrice: totalPrice,
                        ),
                ),
              ),
              if (cartState.cartItems.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          totalAmount: cartState.grandTotal,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: const Border(
                        top: BorderSide(
                          width: 0.5,
                          color: Colors.black38,
                        ),
                      ),
                      color: HexColor("#e5e5e5"),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(20, 0, 0, 0),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.065,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor("#1059c8"),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FittedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "item",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        cartState.cartItems.length.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "View payment summary",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          size: 19,
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
