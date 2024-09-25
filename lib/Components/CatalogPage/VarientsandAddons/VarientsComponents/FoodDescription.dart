import 'package:cached_network_image/cached_network_image.dart';
import 'package:crayondcart/Models/ProductsModel.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Fooddescription extends StatefulWidget {
  final Products products;
  const Fooddescription({super.key, required this.products});

  @override
  State<Fooddescription> createState() => _FooddescriptionState();
}

class _FooddescriptionState extends State<Fooddescription> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
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
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Text(
              "${widget.products.description}",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
