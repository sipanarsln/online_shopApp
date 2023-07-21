import 'package:equatable/equatable.dart';
import 'package:online_shop/product/utility/base/base_firebase_model.dart';

class Products extends Equatable with IdModel, BaseFirebaseModel<Products> {
  Products(
      {this.category, this.categoryId, this.title, this.image, this.price});
  final String? category;
  final String? categoryId;
  final String? title;
  final String? image;
  final String? price;

  @override
  List<Object?> get props => [category, categoryId, title, image, price];

  Products copyWith({
    String? category,
    String? categoryId,
    String? title,
    String? image,
    String? price,
  }) {
    return Products(
      category: category ?? this.category,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'categoryId': categoryId,
      'title': title,
      'image': image,
      'price': price,
    };
  }

  @override
  Products fromJSon(Map<String, dynamic> json) {
    return Products(
      category: json['category'] as String?,
      categoryId: json['categoryId'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      price: json['price'] as String?,
    );
  }

  @override
  String? get id => throw UnimplementedError();
}
