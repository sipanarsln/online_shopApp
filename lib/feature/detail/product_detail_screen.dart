import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:online_shop/product/constants/color_constants.dart';
import 'package:online_shop/product/widget/text/product_name_text.dart';

import '../../product/models/products.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen(this.products, {super.key});

  final Products products;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _productImage(products: products),
          const SizedBox(height: 15),
          Padding(
            padding: context.padding.low,
            child: ProductName(
              text: products.title ?? "",
              color: ColorConstants.black,
            ),
          )
        ],
      ),
    );
  }
}

class _productImage extends StatelessWidget {
  const _productImage({
    super.key,
    required this.products,
  });

  final Products products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            products.image ?? "",
          ),
        ),
      ),
    );
  }
}
