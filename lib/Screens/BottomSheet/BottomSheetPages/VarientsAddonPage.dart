import 'package:crayondcart/Components/CatalogPage/VarientsandAddons/AddonsComponents/Addons.dart';
import 'package:crayondcart/Components/CatalogPage/VarientsandAddons/VarientsComponents/FoodDescription.dart';
import 'package:crayondcart/Components/CatalogPage/VarientsandAddons/VarientsComponents/VarientTitle.dart';
import 'package:crayondcart/Components/GlobalComponents/Counter.dart';
import 'package:crayondcart/Models/CartModel.dart';
import 'package:crayondcart/Models/ProductsModel.dart';
import 'package:crayondcart/Provider/CartProvider.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class CatalogAddonPage extends StatefulWidget {
  final Products products;
  const CatalogAddonPage({super.key, required this.products});

  @override
  State<CatalogAddonPage> createState() => _CatalogAddonPageState();
}

class _CatalogAddonPageState extends State<CatalogAddonPage> {
  @override
  void initState() {
    super.initState();
    totalCount = widget.products.price;
    baseProductPrice = widget.products.price;
  }

  List<CartItem> cart = [];

  int? selectedVariantIndex;
  double? selectedVariantPrice;
  bool isVarientSelected = false;

  int _Itemcounter = 1;
  int _selectedValue = 0;
  double? baseProductPrice;

  double? totalCount;

  void incrementCounter() {
    setState(() {
      if (selectedVariantPrice != null) {
        _Itemcounter++;

        totalCount = totalCount! + baseProductPrice!;
        totalCount = totalCount! + selectedVariantPrice!;
      }
    });
  }

  void decrementCounter() {
    setState(() {
      if (_Itemcounter > 1) {
        _Itemcounter--;

        totalCount = totalCount! - baseProductPrice!;
        totalCount = totalCount! - selectedVariantPrice!;
      }
    });
  }

  void addToCart(BuildContext context) {
    if (selectedVariantIndex != null) {
      Varients selectedVariant =
          widget.products.varients![selectedVariantIndex!];

      Provider.of<CartProvider>(context, listen: false).addToCart(
        widget.products,
        _Itemcounter,
        selectedVariant,
        _Itemcounter,
      );

      setState(() {
        isVarientSelected = false;
        _Itemcounter = 1;
        selectedVariantIndex = null;
      });

      Navigator.of(context).pop();
      var snackBar = SnackBar(
        duration: const Duration(milliseconds: 700),
        dismissDirection: DismissDirection.startToEnd,
        shape: const StadiumBorder(),
        backgroundColor: Colors.green,
        content: const Text("Item successfully added"),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 70,
          left: 10,
          right: 10,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      setState(() {
        isVarientSelected = true;
      });
    }
  }

  BorderRadius dynamicBorder = const BorderRadius.only(
    topLeft: Radius.circular(10),
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(0),
    topRight: Radius.circular(0),
  );

  PageController addonController = PageController();
  int selectedAddon = 0;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VarientTitle(
                title: "Varients & Add-ons",
                titleIcon: Icons.arrow_forward_ios_rounded,
              ),
              const SizedBox(
                height: 20,
              ),
              Fooddescription(
                products: widget.products,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black54,
                  ),
                  color: HexColor("#e5e5e5"),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (addonController.hasClients) {
                            addonController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                          setState(() {
                            _selectedValue = 0;
                            dynamicBorder = const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(0),
                              topRight: Radius.circular(0),
                            );
                          });
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: _selectedValue == 0
                                  ? HexColor("#1059c8")
                                  : HexColor("#d7dadd"),
                              borderRadius: dynamicBorder,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            child: RichText(
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.left,
                              textDirection: TextDirection.ltr,
                              softWrap: true,
                              maxLines: 1,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Varients ',
                                    style: TextStyle(
                                      color: _selectedValue == 0
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '(${widget.products.varients!.length})',
                                    style: TextStyle(
                                      color: _selectedValue == 1
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (addonController.hasClients) {
                            addonController.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }

                          setState(() {
                            _selectedValue = 1;
                            dynamicBorder = const BorderRadius.only(
                              topLeft: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(8),
                              topRight: Radius.circular(8),
                            );
                          });
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: _selectedValue == 1
                                  ? HexColor("#1059c8")
                                  : HexColor("#d7dadd"),
                              borderRadius:
                                  _selectedValue == 1 ? dynamicBorder : null,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            child: Text(
                              'Add-ons',
                              style: TextStyle(
                                color: _selectedValue == 1
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ExpandablePageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: addonController,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Quality",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          if (isVarientSelected)
                            Text(
                              "Select one varient",
                              style: Theme.of(context).textTheme.displaySmall,
                            )
                        ],
                      ),
                      Wrap(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.products.varients!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RadioListTile(
                                          contentPadding: EdgeInsets.zero,
                                          activeColor: HexColor("#1059c8"),
                                          title: Text(
                                            "${widget.products.varients![index].name}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          value: index,
                                          groupValue: selectedVariantIndex,
                                          onChanged: (value) {
                                            setState(() {
                                              if (selectedVariantIndex !=
                                                  null) {
                                                totalCount = totalCount! -
                                                    widget
                                                        .products
                                                        .varients![
                                                            selectedVariantIndex!]
                                                        .price!;
                                              }

                                              selectedVariantIndex = value!;
                                              selectedVariantPrice = widget
                                                  .products
                                                  .varients![index]
                                                  .price;

                                              totalCount =
                                                  widget.products.price! +
                                                      selectedVariantPrice!;
                                              _Itemcounter = 1;
                                              isVarientSelected = false;
                                            });
                                          },
                                        ),
                                      ),
                                      Text(
                                        "SAR ${widget.products.varients![index].price}",
                                        style: TextStyle(
                                          color: selectedVariantIndex == index
                                              ? HexColor("#1059c8")
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (index !=
                                      widget.products.varients!.length - 1)
                                    Divider(
                                      color: Colors.grey[400],
                                      thickness: 1,
                                      height: 0,
                                    ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const AddonsPage()
                ],
              )
            ],
          ),
        ),
        Container(
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
                vertical: 15,
                horizontal: 15,
              ),
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Item total",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        RichText(
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          softWrap: true,
                          maxLines: 1,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: totalCount!.toStringAsFixed(2),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: ' SAR',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Counter(
                          count: _Itemcounter,
                          decrementCounter: decrementCounter,
                          horPadding: 10,
                          incrementCounter: incrementCounter,
                          verPadding: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              addToCart(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HexColor("#1059c8"),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 10,
                                ),
                                child: Center(
                                  child: Text(
                                    "Add to order",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}
