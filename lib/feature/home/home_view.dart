import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/product/models/products.dart';

import '../../product/utility/exception/custom_exception.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection("products");

    final response = products.withConverter(
      fromFirestore: (snapshot, options) {
        final jsonBody = snapshot.data();
        if (jsonBody != null) {
          return Products.fromJson(jsonBody);
        }
        return null;
      },
      toFirestore: (value, options) {
        if (value == null) throw FirebaseCustomException("$value not null");
        return value.toJson();
      },
    ).get();
    return Scaffold(
      body: FutureBuilder(
        future: products.get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Placeholder();
            case ConnectionState.waiting:
              break;
            case ConnectionState.active:
              return LinearProgressIndicator();
            case ConnectionState.done:
              break;
          }
        },
      ),
    );
  }
}
