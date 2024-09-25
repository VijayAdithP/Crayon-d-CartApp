import 'package:cached_network_image/cached_network_image.dart';
import 'package:crayondcart/Models/ProductsModel.dart';
import 'package:crayondcart/Screens/BottomSheet/BottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductCards extends StatefulWidget {
  final List<Products> products;
  final int index;
  const ProductCards({super.key, required this.products, required this.index});

  @override
  State<ProductCards> createState() => _ProductCardsState();
}

class _ProductCardsState extends State<ProductCards> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (widget.products[widget.index].status == 1 &&
                widget.products[widget.index].stock != 0) {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: [
                        CatalogBottomSheet(
                          products: widget.products[widget.index],
                        ),
                      ],
                    );
                  });
            }
          },
          child: PhysicalModel(
            color: Colors.black26,
            shadowColor: Colors.black26,
            elevation: 3,
            borderRadius: BorderRadius.circular(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor(
                    "#e5e5e5",
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7),
                              topRight: Radius.circular(7),
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  colorFilter: (widget.products[widget.index]
                                                  .status ==
                                              2 ||
                                          widget.products[widget.index]
                                                  .status ==
                                              3 ||
                                          widget.products[widget.index].stock ==
                                              0)
                                      ? const ColorFilter.mode(
                                          Colors.grey,
                                          BlendMode.lighten,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                            imageUrl: widget.products[widget.index].image!,
                            placeholder: (context, url) => Container(
                              decoration: BoxDecoration(
                                color: HexColor("#cdd0d3"),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/img/placeholder_image.png",
                                  ),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Container(
                            color: HexColor(
                              "#e5e5e5",
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.products[widget.index].name!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color:
                                        widget.products[widget.index].status ==
                                                2
                                            ? Colors.grey[600]
                                            : Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                if (widget.products[widget.index].status == 1)
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.ltr,
                                    softWrap: true,
                                    maxLines: 1,
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: widget.products[widget.index]
                                              .varients!.length
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.black38,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: " varients",
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (widget.products[widget.index].stock == 0)
                                  const Text(
                                    "Out of stock",
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                if (widget.products[widget.index].status == 3)
                                  const Text(
                                    "Unavailable",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          right: 10,
          top: 10,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.black45,
            child: Icon(
              Icons.info_outline_rounded,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}
