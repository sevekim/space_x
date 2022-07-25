import 'package:flutter/material.dart';

import '../../../core/constants/padding_constant.dart';
import '../../../core/constants/screen_constant.dart';
import '../../../core/constants/string_constant.dart';

class CommonErrorScreen extends StatelessWidget {
  final String? errorType;
  const CommonErrorScreen({
    Key? key,
    this.errorType = error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: commonScaffoldAllPadding,
      alignment: Alignment.center,
      child: Text(
        errorScreenConstants[errorType],
        textAlign: TextAlign.center,
      ),
    );
  }
}
