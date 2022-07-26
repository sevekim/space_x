import 'package:flutter/material.dart';
import 'package:space_x/core/constants/padding_constant.dart';
import 'package:space_x/core/model/upcoming_launch_model/upcoming_launch_model.dart';

import 'single_list_modal_launch_data.dart';
import 'single_list_modal_launch_pad_data.dart';
import 'single_list_modal_rocket_data/single_list_modal_rocket_data.dart';

class SingleListModalBuilder extends StatelessWidget {
  final UpcomingLaunchData singleLaunchData;
  final ScrollController scrollController;
  const SingleListModalBuilder({
    Key? key,
    required this.singleLaunchData,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: 3,
      padding: commonScaffoldScrollablePadding,
      itemBuilder: (BuildContext context, int index) {
        return index == 0
            ? SingleListModalLaunchDataBuilder(
                singleLaunchData: singleLaunchData,
              )
            : index == 1
                ? const SingleListModalRocketDataBuilder()
                : const SingleListModallaunchPadDataBuilder();
      },
    );
  }
}
