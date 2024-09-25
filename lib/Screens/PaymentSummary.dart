import 'package:crayondcart/Components/GlobalComponents/ProceedToPaymentCard.dart';
import 'package:crayondcart/Components/GlobalComponents/OrderId.dart';
import 'package:crayondcart/components/Payment%20Page/PriceList.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Components/Payment Page/PriceListicon.dart';

class PaymentPage extends StatefulWidget {
  final double? totalAmount;
  const PaymentPage({super.key, required this.totalAmount});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int discountAmount = 5;
  double grandTotal = 0;

  @override
  void initState() {
    grandTotal = widget.totalAmount! - discountAmount - 5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#e5e5e5"),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.grey[700],
        ),
        backgroundColor: HexColor("#052437"),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
        ),
        leadingWidth: 35,
        title: const Text(
          "Payment Summary",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HeaderText(
                        text1: 'Order ID: ',
                        text2: '0000001',
                      ),
                      Row(
                        children: [
                          Container(
                            height: 17,
                            width: 17,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/img/cashier-machine_687256.png"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Vijay",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                PricingText(
                  title: "Sub total",
                  price: widget.totalAmount!.toStringAsFixed(2),
                ),
                PricelistIcon(
                  price: discountAmount.toString(),
                  title: "Discounts",
                  priceColor: Colors.green,
                ),
                PricingText(
                  title: "Taxable amount",
                  price: widget.totalAmount!.toStringAsFixed(2),
                ),
                const PricingText(
                  title: "Total tax",
                  price: "0.00",
                ),
                const Divider(),
                PricingText(
                  price: grandTotal.toStringAsFixed(2),
                  title: "Grand total",
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Colors.grey[400]!,
                    ),
                  ),
                  color: HexColor("#e5e5e5"),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_to_photos_outlined,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Add notes",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Colors.grey[400]!,
                    ),
                  ),
                  color: HexColor("#e5e5e5"),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addtionalCards(
                        "Customer",
                        Icons.person,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      addtionalCards(
                        "Coupon",
                        Icons.remove,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      addtionalCards(
                        "Discount",
                        Icons.discount,
                      ),
                    ],
                  ),
                ),
              ),
              const BottomBillCard(),
            ],
          )
        ],
      ),
    );
  }

  Widget addtionalCards(String title, IconData icon) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black38,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
