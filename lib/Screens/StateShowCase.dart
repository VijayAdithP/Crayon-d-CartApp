import 'package:crayondcart/Provider/ShowCaseProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Stateshowcase extends ConsumerWidget {
  const Stateshowcase({super.key});

  @override
  Widget build(BuildContext context, ref) {
     final _Productdata = ref.watch(productDataProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _Productdata.when(
            data: (productData) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.6,
                width: MediaQuery.sizeOf(context).width,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: productData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(productData[index].title!),
                    );
                  },
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(
              child: Text('Error is: $error'),
            ),
          ),
        ],
      ),
    );
  }
}
