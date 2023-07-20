import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:online_shop/product/constants/color_constants.dart';
import 'package:online_shop/product/models/products.dart';
import 'package:online_shop/product/utility/exception/custom_exception.dart';

import '../../../product/widget/text/product_name.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final products = FirebaseFirestore.instance.collection('products');

    final response = products.withConverter(
      fromFirestore: (snapshot, options) {
        return Products().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        if (value == null) throw FirebaseCustomException('$value not null .');
        return value.toJson();
      },
    ).get();
    return FutureBuilder(
      future: response,
      builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot<Products?>> snapshot,
      ) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Placeholder();
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const LinearProgressIndicator();
          case ConnectionState.done:
            if (snapshot.hasData) {
              final values = snapshot.data!.docs.map((e) => e.data()).toList();
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 5 / 8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: values.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          fit: BoxFit.cover,
                          values[index]?.image ?? '',
                          height: context.dynamicHeight(.2),
                        ),
                        SizedBox(height: 10),
                        ProductName(
                          text: values[index]?.title ?? '',
                          color: ColorConstants.black,
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
        }
      },
    );
  }
}
