import 'package:flutter/material.dart';
import 'package:space_x/ui/screens/app_stream_parent.dart';

/// **********************************************************************
///
/// Main Route Screen Map
///
/// **********************************************************************/

Map<String, Widget Function(BuildContext)> routeScreenMap = {
  /// **********************************************************************
  ///
  /// Home Screen
  ///
  /// **********************************************************************/

  '/': (context) => const AppStreamParent(),
};
