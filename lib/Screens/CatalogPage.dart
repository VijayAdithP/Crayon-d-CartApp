import 'package:crayondcart/Components/CatalogPage/CategoryCard.dart';
import 'package:crayondcart/Components/CatalogPage/ItemCards.dart';
import 'package:crayondcart/Components/GlobalComponents/ProceedToPaymentCard.dart';
import 'package:crayondcart/Models/ProductsModel.dart';
import 'package:crayondcart/models/Data/ProductData.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void filterProducts(String category) {
    setState(() {
      if (category == "All") {
        filteredProducts = products;
      } else {
        filteredProducts =
            products.where((product) => product.category == category).toList();
      }
    });
  }

  List<Products> products = productsList;
  List<Products> filteredProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#d7dadd"),
      appBar: AppBar(
        backgroundColor: HexColor("#d7dadd"),
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 20,
          ),
          child: Text(
            "Catalog",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        leadingWidth: 100,
        actions: [
          Icon(
            size: 35,
            Icons.more_vert,
            color: Colors.grey[800],
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              size: 35,
              Icons.close,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FilterWidget(
                    products: products,
                    onCategorySelected: filterProducts,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 10,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: filteredProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.65,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ProductCards(
                          index: index,
                          products: filteredProducts,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const BottomBillCard(),
        ],
      ),
    );
  }
}
