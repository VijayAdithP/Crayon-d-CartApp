import 'package:crayondcart/Models/ProductsModel.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FilterWidget extends StatefulWidget {
  final List<Products> products;
  final Function(String) onCategorySelected;

  const FilterWidget({
    required this.products,
    required this.onCategorySelected,
    super.key,
  });

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  int selectedIndex = 0;
  PageController scrollController = PageController();
  final List<String> customCategories = ['All', 'Favourites'];
  late List<String> uniqueCategories;

  @override
  void initState() {
    super.initState();

    final Set<String> categorySet = {...customCategories};

    for (var product in widget.products) {
      categorySet.add(product.category ?? '');
    }

    uniqueCategories = categorySet.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10),
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: uniqueCategories.length,
              itemBuilder: (context, index) {
                String category = uniqueCategories[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });

                      widget.onCategorySelected(category);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: selectedIndex == index
                              ? Colors.transparent
                              : Colors.grey[500]!,
                        ),
                        color: selectedIndex == index
                            ? HexColor("#1059c8")
                            : HexColor("#e5e5e5"),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              if (category == 'Favourites')
                                Icon(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  selectedIndex == index
                                      ? Icons.star_rounded
                                      : Icons.star_border_rounded,
                                ),
                              Text(
                                category,
                                style: TextStyle(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Align(
            alignment: Alignment.center,
            child: SmoothPageIndicator(
              controller: scrollController,
              count: (uniqueCategories.length / 6).ceil(),
              effect: const ExpandingDotsEffect(
                dotWidth: 8,
                dotHeight: 8,
                spacing: 5.0,
                dotColor: Colors.grey,
                activeDotColor: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
