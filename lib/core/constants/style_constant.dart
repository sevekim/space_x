import 'package:flutter/material.dart';

import 'color_constant.dart';
import 'string_constant.dart';

//////////////////////////////////////////////
/// List Header Text
//////////////////////////////////////////////

const TextStyle commonListHeaderTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 15.0,
);

//////////////////////////////////////////////
///  Header Text
//////////////////////////////////////////////

final TextStyle commonHeaderTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 20.0,
  color: defaultColorPalette[mainBlackColor],
);

//////////////////////////////////////////////
///  SubHeader Text
//////////////////////////////////////////////

final TextStyle commonSubheaderTextStyle = TextStyle(
  fontSize: 15.0,
  color: defaultColorPalette[subTextColor],
);

//////////////////////////////////////////////
///  commonSingleModalInfoHeader
//////////////////////////////////////////////

final TextStyle commonSingleModalInfoHeader = TextStyle(
  color: defaultColorPalette[subTextColor],
);

//////////////////////////////////////////////
///  commonSingleModalInfoBody
//////////////////////////////////////////////

final TextStyle commonSingleModalInfoBody = TextStyle(
  fontWeight: FontWeight.w600,
  color: defaultColorPalette[mainBlackColor],
);

//////////////////////////////////////////////
///  commonSingleModalInfoBody
//////////////////////////////////////////////

final TextStyle commonSingleModalPanelHeader = TextStyle(
  fontWeight: FontWeight.w700,
  color: defaultColorPalette[mainBlue],
);
