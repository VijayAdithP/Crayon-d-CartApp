// import 'package:crayondcart/Models/ProductsModel.dart';
// import 'package:crayondcart/Provider/controllers/CartRiverPod.dart';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
 
// class OrderAddCard extends StatefulWidget {
//   final Products products;
//   double? totalCount;
//   int? selectedVariantIndex;
//   int itemcounter;
//   bool? isVarientSelected;
//   Function(bool? varientSelected) onVariantSelected;
//   OrderAddCard({
//     super.key,
//     required this.totalCount,
//     required this.itemcounter,
//     required this.products,
//     required this.selectedVariantIndex,
//     required this.onVariantSelected,
//   });

//   @override
//   State<OrderAddCard> createState() => _OrderAddCardState();
// }

// class _OrderAddCardState extends State<OrderAddCard> {
//   bool? isVariantslelected;

//   @override
//   void initState() {
//     super.initState();
//     isVariantslelected = widget.isVarientSelected;
//   }

//   late CartProvider _cartState;
//   void incrementCounter() {
//     setState(() {
//       widget.itemcounter++;
//       widget.totalCount = widget.totalCount! + widget.products.price!;
//     });
//   }

//   void decrementCounter() {
//     setState(() {
//       if (widget.itemcounter > 1) {
//         widget.itemcounter--;
//         widget.totalCount = widget.totalCount! - widget.products.price!;
//       }
//     });
//   }

//   // void addToCart(BuildContext context) {
//   //   if (widget.selectedVariantIndex != null) {
//   //     Varients selectedVariant =
//   //         widget.products.varients![widget.selectedVariantIndex!];

//   //     // Provider.of<CartProvider>(context, listen: false).addToCart(
//   //     //   widget.products,
//   //     //   widget.itemcounter,
//   //     //   selectedVariant,
//   //     //   widget.itemcounter,
//   //     // );
//   //     _cartState.addToCart(
//   //       widget.products,
//   //       widget.itemcounter,
//   //       selectedVariant,
//   //       widget.itemcounter,
//   //     );

//   //     setState(() {
//   //       isVariantslelected = false;
//   //       widget.itemcounter = 1;
//   //       widget.selectedVariantIndex = null;
//   //     });
//   //     Navigator.of(context).pop();

//   //     var snackBar = SnackBar(
//   //       duration: const Duration(
//   //         milliseconds: 700,
//   //       ),
//   //       dismissDirection: DismissDirection.startToEnd,
//   //       shape: const StadiumBorder(),
//   //       backgroundColor: Colors.green,
//   //       content: const Text("Item successfully added"),
//   //       behavior: SnackBarBehavior.floating,
//   //       margin: EdgeInsets.only(
//   //           bottom: MediaQuery.of(context).size.height - 70,
//   //           left: 10,
//   //           right: 10),
//   //     );
//   //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   //   }
//   //   if (widget.selectedVariantIndex == null) {
//   //     setState(() {
//   //       isVariantslelected = true;
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: const Border(
//           top: BorderSide(
//             width: 0.5,
//             color: Colors.black38,
//           ),
//         ),
//         color: HexColor("#e5e5e5"),
//         boxShadow: const [
//           BoxShadow(
//             color: Color.fromARGB(20, 0, 0, 0),
//             blurRadius: 10,
//           )
//         ],
//       ),
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             vertical: 15,
//             horizontal: 15,
//           ),
//           child: SizedBox(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       "Item total",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 17,
//                       ),
//                     ),
//                     RichText(
//                       overflow: TextOverflow.clip,
//                       textAlign: TextAlign.left,
//                       textDirection: TextDirection.ltr,
//                       softWrap: true,
//                       maxLines: 1,
//                       text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(
//                             text: widget.totalCount!.toStringAsFixed(2),
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const TextSpan(
//                             text: ' SAR',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(
//                           10,
//                         ),
//                         border: Border.all(),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 15,
//                           horizontal: 10,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             GestureDetector(
//                               onTap: decrementCounter,
//                               child: const Icon(
//                                 Icons.remove,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               widget.itemcounter.toString(),
//                               style: const TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             GestureDetector(
//                               onTap: incrementCounter,
//                               child: const Icon(
//                                 Icons.add,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//                           // addToCart(context);
//                           if (widget.selectedVariantIndex != null) {
//                             Varients selectedVariant = widget.products
//                                 .varients![widget.selectedVariantIndex!];

//                             // Provider.of<CartProvider>(context, listen: false).addToCart(
//                             //   widget.products,
//                             //   widget.itemcounter,
//                             //   selectedVariant,
//                             //   widget.itemcounter,
//                             // );
//                             _cartState.addToCart(
//                               widget.products,
//                               widget.itemcounter,
//                               selectedVariant,
//                               widget.itemcounter,
//                             );

//                             setState(() {
//                               isVariantslelected = false;
//                               widget.itemcounter = 1;
//                               widget.selectedVariantIndex = null;
//                             });
//                             Navigator.of(context).pop();

//                             var snackBar = SnackBar(
//                               duration: const Duration(
//                                 milliseconds: 700,
//                               ),
//                               dismissDirection: DismissDirection.startToEnd,
//                               shape: const StadiumBorder(),
//                               backgroundColor: Colors.green,
//                               content: const Text("Item successfully added"),
//                               behavior: SnackBarBehavior.floating,
//                               margin: EdgeInsets.only(
//                                   bottom:
//                                       MediaQuery.of(context).size.height - 70,
//                                   left: 10,
//                                   right: 10),
//                             );
//                             ScaffoldMessenger.of(context)
//                                 .showSnackBar(snackBar);
//                           }
//                           if (widget.selectedVariantIndex == null) {
//                             setState(() {
//                               isVariantslelected = true;
//                             });
//                           }
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: HexColor("#1059c8"),
//                           ),
//                           child: const Padding(
//                             padding: EdgeInsets.symmetric(
//                               vertical: 15,
//                               horizontal: 10,
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "Add to order",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
