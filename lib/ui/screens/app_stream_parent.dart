import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/core/constants/string_constant.dart';
import 'package:space_x/core/providers/app_provider.dart';

import '../../core/constants/api_constant.dart';
import '../widgets/error_screen/common_error_screen.dart';
import 'home_screen/home_screen.dart';
import 'loading_screen/loading_screen.dart';

class AppStreamParent extends StatelessWidget {
  const AppStreamParent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(
      context,
      listen: false,
    );

    return FutureBuilder<void>(
      future: provider.getInitialData(
        context: context,
      ),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppStreamLoadingScreen();
        } else if (snapshot.connectionState == ConnectionState.done) {
          return const HomeScreen();

          //There is no connection, thus by default, just show NotLoggedIn()
        } else {
          return const CommonErrorScreen();
        }
      },
    );
  }
}
