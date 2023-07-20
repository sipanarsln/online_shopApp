import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProductName extends StatelessWidget {
  const ProductName({
    required this.text,
    required this.color,
    super.key,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.titleMedium
          ?.copyWith(fontWeight: FontWeight.bold, color: color),
    );
  }
}
