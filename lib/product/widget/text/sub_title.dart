import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.titleMedium,
    );
  }
}
