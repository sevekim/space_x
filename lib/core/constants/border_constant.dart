import 'package:flutter/material.dart';

/// **********************************************************************
///
/// Default Radius
///
/// **********************************************************************/

const BorderRadius defaultBorderRadius = BorderRadius.all(
  Radius.circular(
    10.0,
  ),
);

const RoundedRectangleBorder defaultRoundedRectangleBorderForModal =
    RoundedRectangleBorder(
  borderRadius: defaultBorderRadiusTopOnly,
);

const BorderRadius defaultBorderRadiusTopOnly = BorderRadius.only(
  topLeft: Radius.circular(
    10.0,
  ),
  topRight: Radius.circular(
    10.0,
  ),
);
