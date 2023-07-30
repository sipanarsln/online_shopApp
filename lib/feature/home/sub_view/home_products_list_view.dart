import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:online_shop/feature/detail/product_detail_screen.dart';
import 'package:online_shop/product/constants/color_constants.dart';
import 'package:online_shop/product/models/products.dart';
import 'package:online_shop/product/utility/exception/custom_exception.dart';
import 'package:online_shop/product/widget/text/product_name_text.dart';
import 'package:online_shop/product/widget/text/product_price_text.dart';

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
                  maxCrossAxisExtent: 195,
                  childAspectRatio: 7 / 10,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 15,
                ),
                itemCount: values.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  // ignore: cast_nullable_to_non_nullable
                  final product = values[index] as Products;

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        // ignore: inference_failure_on_instance_creation
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(product),
                        ),
                      );
                    },
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            fit: BoxFit.cover,
                            values[index]?.image ?? '',
                            // ignore: deprecated_member_use
                            height: context.dynamicHeight(.2),
                          ),
                          Padding(
                            padding: context.paddingLow / 1.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ProductName(
                                  text: values[index]?.title ?? '',
                                  color: ColorConstants.black,
                                ),
                                ProductPrice(
                                  text: values[index]?.price ?? '',
                                  color: ColorConstants.primaryColor,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: ColorConstants.primaryColor,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  iconSize: 20,
                                  padding: const EdgeInsets.only(
                                      bottom: 2, right: 0),
                                  icon: const Icon(Icons.shopping_bag_outlined),
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
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
