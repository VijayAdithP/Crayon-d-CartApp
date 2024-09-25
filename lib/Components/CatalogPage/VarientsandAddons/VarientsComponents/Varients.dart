import 'package:crayondcart/Models/ProductsModel.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class VarientsPage extends StatefulWidget {
  final bool isVarientSelected;
  final Products products;
  final int? selectedVariantIndex;
  final double? totalCount;
  final double? selectedVariantPrice;
  final Function(int? selectedIndex, double? totalPrice, double? variantPrice)
      onVariantSelected;

  const VarientsPage({
    super.key,
    required this.isVarientSelected,
    required this.products,
    this.selectedVariantIndex,
    this.totalCount,
    this.selectedVariantPrice,
    required this.onVariantSelected,
  });

  @override
  State<VarientsPage> createState() => _VarientsPageState();
}

class _VarientsPageState extends State<VarientsPage> {
  int? _selectedVariantIndex;
  double? _totalCount;
  double? _selectedVariantPrice;

  @override
  void initState() {
    super.initState();
    _selectedVariantIndex = widget.selectedVariantIndex;
    _totalCount = widget.totalCount;
    _selectedVariantPrice = widget.selectedVariantPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Quality",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            if (widget.isVarientSelected)
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
                            groupValue: _selectedVariantIndex,
                            onChanged: (value) {
                              setState(() {
                                if (_selectedVariantIndex != null) {
                                  _totalCount = _totalCount! -
                                      widget
                                          .products
                                          .varients![_selectedVariantIndex!]
                                          .price!;
                                }

                                _selectedVariantIndex = value!;
                                _selectedVariantPrice =
                                    widget.products.varients![index].price;

                                _totalCount =
                                    _totalCount! + _selectedVariantPrice!;

                                widget.onVariantSelected(
                                  _selectedVariantIndex,
                                  _totalCount,
                                  _selectedVariantPrice,
                                );
                              });
                            },
                          ),
                        ),
                        Text(
                          "SAR ${widget.products.varients![index].price}",
                          style: TextStyle(
                            color: _selectedVariantIndex == index
                                ? HexColor("#1059c8")
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    if (index != widget.products.varients!.length - 1)
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
    );
  }
}
