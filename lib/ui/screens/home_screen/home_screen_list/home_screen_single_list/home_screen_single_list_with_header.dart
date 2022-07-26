import 'package:flutter/material.dart';
import 'package:space_x/core/constants/padding_constant.dart';
import 'package:space_x/core/model/upcoming_launch_model/upcoming_launch_model.dart';

import '../../../../../core/constants/style_constant.dart';
import 'home_screen_single_list.dart';

class HomeScreenSingleListWithHeader extends StatelessWidget {
  const HomeScreenSingleListWithHeader({
    Key? key,
    required this.launchMonthYear,
    required this.singleLaunchData,
  }) : super(key: key);

  final String launchMonthYear;
  final UpcomingLaunchData singleLaunchData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: commonVerticalNextWidgetPadding,
          child: Text(
            launchMonthYear,
            style: commonListHeaderTextStyle,
          ),
        ),
        HomeScreenSingleList(
          singleLaunchData: singleLaunchData,
        ),
      ],
    );
  }
}
