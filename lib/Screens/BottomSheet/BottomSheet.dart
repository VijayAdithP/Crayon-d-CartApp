import 'package:crayondcart/Models/ProductsModel.dart';
import 'package:crayondcart/Screens/BottomSheet/BottomSheetPages/ItemInfoPage.dart';
import 'package:crayondcart/Screens/BottomSheet/BottomSheetPages/VarientsAddonPage.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CatalogBottomSheet extends StatefulWidget {
  final Products products;

  const CatalogBottomSheet({super.key, required this.products});

  @override
  State<CatalogBottomSheet> createState() => Catalog_BottomSheetState();
}

class Catalog_BottomSheetState extends State<CatalogBottomSheet> {
  final PageController _pageController = PageController();

  void goToNextPage() {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: HexColor("#d7dadd"),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExpandablePageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ItemDescriptionPage(
                  products: widget.products,
                  onNextPage: goToNextPage,
                ),
                CatalogAddonPage(
                  products: widget.products,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
