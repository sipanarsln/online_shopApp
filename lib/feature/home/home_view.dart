import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
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
    return Scaffold(
      body: _HomeListView(),
    );
  }
}

class _HomeListView extends StatelessWidget {
  const _HomeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection("products");

    final response = products.withConverter(
      fromFirestore: (snapshot, options) {
        return Products().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        if (value == null) throw FirebaseCustomException("$value not null .");
        return value.toJson();
      },
    ).get();
    return FutureBuilder(
      future: response,
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Products?>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Placeholder();
          case ConnectionState.waiting:
          case ConnectionState.active:
            return LinearProgressIndicator();
          case ConnectionState.done:
            if (snapshot.hasData) {
              final values = snapshot.data!.docs.map((e) => e.data()).toList();

              return ListView.builder(
                  itemCount: values.length,
                  itemBuilder: (BuildContext context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Image.network(
                            values[index]?.image ?? '',
                            height: context.dynamicHeight(.1),
                          ),
                          Text(
                            values[index]?.title ?? '',
                            style: context.textTheme.labelLarge,
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return SizedBox();
            }
        }
      },
    );
  }
}
