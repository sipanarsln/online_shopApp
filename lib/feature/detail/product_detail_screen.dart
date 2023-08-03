import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:online_shop/feature/detail/widget/size_list.dart';
import 'package:online_shop/product/constants/color_constants.dart';
import 'package:online_shop/product/constants/string_constants.dart';
import 'package:online_shop/product/models/products.dart';

import 'package:online_shop/product/widget/fav_button.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen(this.products, {super.key});

  final Products products;

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _counterValue = 1;
  double _productPrice = 0;

  @override
  void initState() {
    super.initState();
    // İlgili ürünün fiyatını başlangıçta _productPrice değişkenine atayalım
    _productPrice = double.parse(widget.products.price ?? '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              _productImage(products: widget.products),
              Positioned(
                top: 60,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left_outlined,
                    size: 40,
                    color: ColorConstants.white,
                  ),
                ),
              ),
              const Positioned(
                top: 65,
                right: 10,
                child: FavButton(),
              ),
            ],
          ),
          const SizedBox(height: 15),
          _productName(products: widget.products),
          const _fontSizeText(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizeList(),
              Padding(
                padding: context.padding.onlyRightMedium,
                child: CounterButton(
                  loading: false,
                  onChange: (int val) {
                    setState(() {
                      _counterValue = val;
                      _productPrice = _productPrice =
                          double.parse(widget.products.price ?? '0') *
                              _counterValue;
                    });
                  },
                  count: _counterValue,
                  countColor: ColorConstants.primaryColor,
                  buttonColor: ColorConstants.primaryColor,
                  progressColor: Colors.purpleAccent,
                ),
              ),
            ],
          ),
          const _description(),
          _descriptionDetails(products: widget.products),
          Padding(
            padding: context.padding.low +
                context.padding.onlyTopMedium / 1.2 +
                context.padding.onlyLeftLow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${_productPrice.toStringAsFixed(0)}',
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
                      StringConstants.shopNow,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: ColorConstants.white,
                          fontSize: 35,
                        ),
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

// ignore: camel_case_types
class _fontSizeText extends StatelessWidget {
  const _fontSizeText();

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

// ignore: camel_case_types
class _description extends StatelessWidget {
  const _description();

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

// ignore: camel_case_types
class _descriptionDetails extends StatelessWidget {
  const _descriptionDetails({
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

// ignore: camel_case_types
class _productName extends StatelessWidget {
  const _productName({
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
