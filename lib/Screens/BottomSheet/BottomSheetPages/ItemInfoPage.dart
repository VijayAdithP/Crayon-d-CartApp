import 'package:cached_network_image/cached_network_image.dart';
import 'package:crayondcart/Models/ProductsModel.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ItemDescriptionPage extends StatefulWidget {
  final Products products;
  final VoidCallback onNextPage;
  const ItemDescriptionPage(
      {super.key, required this.products, required this.onNextPage});

  @override
  State<ItemDescriptionPage> createState() => _ItemDescriptionPageState();
}

class _ItemDescriptionPageState extends State<ItemDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.3,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      20,
                    ),
                    topRight: Radius.circular(20),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  imageUrl: widget.products.image!,
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
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.products.name!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.left,
                        textDirection: TextDirection.ltr,
                        softWrap: true,
                        maxLines: 1,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.products.varients != null
                                  ? widget.products.varients!
                                      .map((v) => v.name)
                                      .join(', ')
                                  : '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "SAR ${widget.products.price}",
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.products.description!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Divider(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Calories per 100g",
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${widget.products.calories} Kcal",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Food Type",
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${widget.products.type}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: widget.onNextPage,
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
                      vertical: 15,
                      horizontal: 10,
                    ),
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
                            "Add item",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          right: 20,
          top: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: HexColor('#c2c1c2'),
              ),
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  size: 27,
                  Icons.close_rounded,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
