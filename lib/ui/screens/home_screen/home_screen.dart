import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/core/constants/padding_constant.dart';
import 'package:space_x/core/providers/app_provider.dart';
import 'package:space_x/ui/screens/home_screen/home_screen_header/home_screen_header.dart';
import 'package:space_x/ui/widgets/common_widgets/common_scaffold_without_background.dart';
import 'package:space_x/ui/widgets/function_widget/common_keyboard_unfocus.dart';

import 'home_screen_list/home_screen_list_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(
      context,
      listen: false,
    );

    return CommonScaffoldWithoutBackground(
      appBar: null,
      onTapFunction: () {
        KeyboardUnfocus.dismissKeyboard(context);
      },
      onWillPop: () async {
        return false;
      },
      childWidget: RefreshIndicator(
        onRefresh: () async {
          await provider.refreshPostMainScreen(
            context: context,
          );
        },
        child: SingleChildScrollView(
          child: Container(
            padding: commonScaffoldAllPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HomeScreenHeader(),
                HomeScreenListBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
