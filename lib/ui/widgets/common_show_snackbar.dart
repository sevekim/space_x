import 'package:flutter/material.dart';

import '../../core/constants/border_constant.dart';
import '../../core/constants/color_constant.dart';
import '../../core/constants/string_constant.dart';

class ShowSnackBar {
  static ScaffoldFeatureController displaySnackBar({
    required BuildContext context,
    String message = 'Temporarily disabled',
  }) {
    SnackBar snackBar = SnackBar(
      backgroundColor: defaultColorPalette[mainBlue],
      content: Text(
        message,
      ),
      action: SnackBarAction(
        label: 'DISMISS',
        onPressed: () {},
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: defaultBorderRadius,
      ),
      behavior: SnackBarBehavior.floating,
    );

    //Remove any previous snackbar
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
