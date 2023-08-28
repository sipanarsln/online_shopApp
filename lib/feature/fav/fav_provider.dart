import 'package:flutter/material.dart';
import 'package:online_shop/product/models/products.dart';

class FavoriteProductsProvider extends ChangeNotifier {
  final List<Products> _favoriteProducts = [];

  List<Products> get favoriteProducts => _favoriteProducts;

  void toggleFavorite(Products product) {
    if (_favoriteProducts.contains(product)) {
      _favoriteProducts.remove(product);
    } else {
      _favoriteProducts.add(product);
    }
    notifyListeners();
  }
}
