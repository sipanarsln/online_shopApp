// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/models/products.dart';
import '../../product/utility/exception/custom_exception.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState());

  Future<void> fetchProducts() async {
    final productsCollectionReferance =
        FirebaseFirestore.instance.collection('products');

    final responce = await productsCollectionReferance.withConverter(
      fromFirestore: (snapshot, options) {
        return Products().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        if (value == null) throw FirebaseCustomException('$value not null .');
        return value.toJson();
      },
    ).get();

    if (responce.docs.isNotEmpty) {
      final values = responce.docs.map((e) => e.data()).toList();
      state = state.copyWith(products: values);
    }
  }
}

class HomeState extends Equatable {
  const HomeState({this.products});

  final List<Products>? products;

  @override
  List<Object?> get props => throw UnimplementedError();

  HomeState copyWith({
    List<Products>? products,
  }) {
    return HomeState(
      products: products ?? this.products,
    );
  }
}
