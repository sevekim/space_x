import 'package:flutter/material.dart';
import 'package:space_x/ui/screens/app_stream_parent_selector.dart';

/// **********************************************************************
///
/// Main Route Screen Map
///
/// **********************************************************************/

Map<String, Widget Function(BuildContext)> routeScreenMap = {
  '/': (context) => const AppStreamParentSelector(),
};
