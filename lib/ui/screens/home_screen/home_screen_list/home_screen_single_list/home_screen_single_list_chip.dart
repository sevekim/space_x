import 'package:flutter/material.dart';
import 'package:space_x/core/constants/color_constant.dart';

class HomeScreenSingleListChip extends StatelessWidget {
  final String text;
  final String textColor;
  final String backgroundColor;

  const HomeScreenSingleListChip({
    Key? key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        text,
        style: TextStyle(
          color: defaultColorPalette[textColor],
        ),
      ),
      backgroundColor: defaultColorPalette[backgroundColor],
    );
  }
}
