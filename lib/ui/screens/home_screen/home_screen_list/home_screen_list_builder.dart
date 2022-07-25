import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/core/providers/app_provider.dart';

import '../../../../core/model/upcoming_launch_model/upcoming_launch_model.dart';
import 'home_screen_single_list/home_screen_single_list.dart';

class HomeScreenListBuilder extends StatelessWidget {
  const HomeScreenListBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(
      context,
      listen: false,
    );

    List<dynamic> upcomingLaunchData = provider.upcomingLaunchData;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: upcomingLaunchData.length,
      itemBuilder: (context, index) {
        UpcomingLaunchData singleLaunchData = UpcomingLaunchData.fromJson(
          upcomingLaunchData[index],
        );
        return HomeScreenSingleList(
          singleLaunchData: singleLaunchData,
        );
      },
    );
  }
}
