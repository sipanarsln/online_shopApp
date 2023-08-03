import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class FavButton extends StatefulWidget {
  const FavButton({super.key});

  @override
  State<FavButton> createState() => _FavButtonState();
}

Color _iconColor = Colors.white;

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          if (_iconColor == ColorConstants.white) {
            _iconColor = ColorConstants.primaryColor;
          } else {
            _iconColor = ColorConstants.white;
          }
        });
      },
      icon: Icon(
        Icons.favorite_outlined,
        size: 30,
        color: _iconColor,
      ),
    );
  }
}
