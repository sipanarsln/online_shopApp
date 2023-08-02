import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:online_shop/feature/detail/widget/size_list.dart';
import 'package:online_shop/product/constants/color_constants.dart';
import 'package:online_shop/product/constants/string_constants.dart';
import 'package:online_shop/product/models/products.dart';
import 'package:online_shop/product/widget/text/product_name_text.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen(this.products, {super.key});

  final Products products;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              _productImage(products: products),
              Positioned(
                top: 60,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_left_outlined,
                    size: 40,
                  ),
                ),
              ),
              Positioned(
                top: 65,
                right: 10,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 30,
                    )),
              )
            ],
          ),
          const SizedBox(height: 15),
          _productName(products: products),
          const _fontSizeText(),
          const SizeList(),
          const _description(),
          _descriptionDetails(products: products),
          Padding(
            padding: context.padding.low +
                context.padding.onlyTopMedium / 1.2 +
                context.padding.onlyLeftLow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  products.price ?? '',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 30,
                      color: ColorConstants.primaryColor,
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 250,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorConstants.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'Shop Now',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: ColorConstants.white, fontSize: 35),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _fontSizeText extends StatelessWidget {
  const _fontSizeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Text(
        StringConstants.selectSize,
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}

class _description extends StatelessWidget {
  const _description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Text(
        StringConstants.productDescription,
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}

class _descriptionDetails extends StatelessWidget {
  const _descriptionDetails({
    super.key,
    required this.products,
  });

  final Products products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Text(
        products.description ?? '',
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 15,
            color: ColorConstants.gray,
          ),
        ),
      ),
    );
  }
}

class _productName extends StatelessWidget {
  const _productName({
    super.key,
    required this.products,
  });

  final Products products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Text(
        products.title ?? '',
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            color: ColorConstants.black,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _productImage extends StatelessWidget {
  const _productImage({
    required this.products,
  });

  final Products products;

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: deprecated_member_use
      height: context.dynamicHeight(0.5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            products.image ?? '',
          ),
        ),
      ),
    );
  }
}
