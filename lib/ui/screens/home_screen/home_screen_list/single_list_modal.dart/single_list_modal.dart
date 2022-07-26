import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/core/model/upcoming_launch_model/upcoming_launch_model.dart';
import 'package:space_x/core/providers/app_provider.dart';

import '../../../../../core/constants/border_constant.dart';
import 'single_list_modal_selector.dart';

class HomeScreenSingleListModal extends StatelessWidget {
  final UpcomingLaunchData singleLaunchData;
  const HomeScreenSingleListModal({
    Key? key,
    required this.singleLaunchData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(
      context,
      listen: false,
    );

    //Upcoming data
    provider.getSingleLaunchData(
      context: context,
      singleLaunchData: singleLaunchData,
    );

    return ClipRRect(
      borderRadius: defaultBorderRadiusTopOnly,
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.7,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Scaffold(
            extendBody: false,
            body: SafeArea(
              child: HomeScreenSingleListModalSelector(
                scrollController: scrollController,
                singleLaunchData: singleLaunchData,
              ),
            ),
          );
        },
      ),
    );
  }
}
