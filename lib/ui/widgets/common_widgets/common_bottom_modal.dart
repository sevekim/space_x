import 'package:flutter/material.dart';

import '../../../core/constants/border_constant.dart';
import '../../../core/constants/padding_constant.dart';
import '../../../core/constants/site_constant.dart';

class ShowBottomModal {
  /// **********************************************************************
  ///
  ///  Show Bottom Modal
  ///
  /// **********************************************************************/

  static showBottomModal({
    required BuildContext context,
    required Widget modalWidget,
    double modalHeight = defaultModalHeight,
    double heightFactor = 0.9,
    bool isScrollControlled = false,
    bool enableDrag = false,
  }) {
    return showModalBottomSheet<void>(
      shape: defaultRoundedRectangleBorderForModal,
      context: context,
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
      builder: (context) {
        return SafeArea(
          child: FractionallySizedBox(
            heightFactor: heightFactor,
            child: Container(
              height: modalHeight,
              padding: commonScaffoldLTRPadding,
              child: modalWidget,
            ),
          ),
        );
      },
    );
  }
}
