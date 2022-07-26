import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/core/model/upcoming_launch_model/upcoming_launch_model.dart';

import '../../../../../core/constants/border_constant.dart';
import '../../../../../core/constants/string_constant.dart';
import '../../../../../core/providers/app_provider.dart';
import '../../../../../core/utils/date_format.dart';
import '../single_list_modal.dart/single_list_modal.dart';
import 'home_screen_single_list_chip.dart';

class HomeScreenSingleList extends StatelessWidget {
  final UpcomingLaunchData singleLaunchData;
  const HomeScreenSingleList({
    Key? key,
    required this.singleLaunchData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomDateFormat dateFormat = CustomDateFormat();

    String localTime = dateFormat.processDateTimeToReadable(
      rawStringDate: singleLaunchData.date_local!,
    );

    final provider = Provider.of<AppProvider>(
      context,
      listen: false,
    );

    return Card(
      child: ListTile(
        title: Text(
          singleLaunchData.name ?? "No name available",
        ),
        subtitle: Text(
          localTime,
        ),
        trailing: HomeScreenSingleListChip(
          text: singleLaunchData.upcoming == true ? "Upcoming" : "Launched",
          backgroundColor: singleLaunchData.upcoming == true
              ? upcomingColorBackground
              : launchedColorBackground,
          textColor:
              singleLaunchData.upcoming == true ? upcomingColor : launchedColor,
        ),
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            shape: defaultRoundedRectangleBorderForModal,
            enableDrag: true,
            builder: (context) {
              return HomeScreenSingleListModal(
                singleLaunchData: singleLaunchData,
              );
            },
          ).whenComplete(() {
            provider.resetSingleLaunchDat();
          });
        },
      ),
    );
  }
}
