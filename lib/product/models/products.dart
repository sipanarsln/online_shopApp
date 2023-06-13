import 'package:equatable/equatable.dart';

class Products extends Equatable {
  final String? category;
  final String? categoryId;
  final String? title;
  final String? image;

  Products({
    this.category,
    this.categoryId,
    this.title,
    this.image,
  });

  @override
  List<Object?> get props => [category, categoryId, title, image];

  Products copyWith({
    String? category,
    String? categoryId,
    String? title,
    String? image,
  }) {
    return Products(
      category: category ?? this.category,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'categoryId': categoryId,
      'title': title,
      'image': image,
    };
  }

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      category: json['category'] as String?,
      categoryId: json['categoryId'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
    );
  }
}
