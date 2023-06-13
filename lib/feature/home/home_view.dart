import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: FutureBuilder(
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
