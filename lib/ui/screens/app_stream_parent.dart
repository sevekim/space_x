import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/core/constants/string_constant.dart';
import 'package:space_x/core/providers/app_provider.dart';

import '../widgets/error_screen/common_error_screen.dart';
import 'home_screen/home_screen.dart';
import 'loading_screen/loading_screen.dart';

class AppStreamParent extends StatelessWidget {
  const AppStreamParent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<AppProvider, String>(
      selector: (buildContext, selectorProvider) =>
          selectorProvider.intialHomeScreenDataRetrieved,
      builder: (_, intialHomeScreenDataRetrieved, __) {
        return intialHomeScreenDataRetrieved == selectorScreenLoading
            ? const AppStreamLoadingScreen()
            : intialHomeScreenDataRetrieved == selectorScreenError
                ? const CommonErrorScreen()
                : const HomeScreen();
      },
    );
  }
}
