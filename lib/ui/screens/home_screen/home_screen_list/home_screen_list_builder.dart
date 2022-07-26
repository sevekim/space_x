import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/core/providers/app_provider.dart';

import '../../../../core/model/upcoming_launch_model/upcoming_launch_model.dart';
import 'home_screen_single_list/home_screen_single_list.dart';
import 'home_screen_single_list/home_screen_single_list_with_header.dart';

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

    List<dynamic> upcomingLaunchData = provider.launchCollectionMapList;
    String? launchDate;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: upcomingLaunchData.length,
      itemBuilder: (context, index) {
        //Get the single launch data
        UpcomingLaunchData singleLaunchData = UpcomingLaunchData.fromJson(
          upcomingLaunchData[index],
        );

        String launchMonthYear = provider.getTimeQueryRangeInString(
          timeInUnix: singleLaunchData.date_unix!,
        );

        //Different Year
        if (launchDate != launchMonthYear) {
          launchDate = launchMonthYear;
          return HomeScreenSingleListWithHeader(
            launchMonthYear: launchMonthYear,
            singleLaunchData: singleLaunchData,
          );
        }

        return HomeScreenSingleList(
          singleLaunchData: singleLaunchData,
        );
      },
    );
  }
}
