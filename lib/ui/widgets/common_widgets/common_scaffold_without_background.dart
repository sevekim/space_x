import 'package:flutter/material.dart';
import 'package:space_x/core/constants/color_constant.dart';
import 'package:space_x/core/constants/string_constant.dart';

class CommonScaffoldWithoutBackground extends StatelessWidget {
  final Widget childWidget;
  final PreferredSizeWidget? appBar;
  final Function() onTapFunction;
  final bool showDrawer;
  final Future<bool> Function()? onWillPop;
  const CommonScaffoldWithoutBackground({
    Key? key,
    required this.childWidget,
    this.appBar,
    required this.onTapFunction,
    this.showDrawer = false,
    this.onWillPop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: GestureDetector(
        onTap: onTapFunction,
        child: Scaffold(
          backgroundColor: defaultColorPalette[defaultGrey],
          appBar: appBar,
          body: SafeArea(
            child: childWidget,
          ),
        ),
      ),
    );
  }
}
