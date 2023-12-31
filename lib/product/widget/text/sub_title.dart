import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({required this.text, required this.color, super.key});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: context.textTheme.titleMedium?.copyWith(color: color));
  }
}
