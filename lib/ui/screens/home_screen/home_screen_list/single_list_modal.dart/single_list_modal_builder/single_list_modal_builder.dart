import 'package:flutter/material.dart';
import 'package:space_x/core/model/upcoming_launch_model/upcoming_launch_model.dart';

import 'single_list_modal_launch_data.dart';
import 'single_list_modal_launch_pad_data.dart';
import 'single_list_modal_rocket_data.dart';

class SingleListModalBuilder extends StatelessWidget {
  final UpcomingLaunchData singleLaunchData;
  const SingleListModalBuilder({
    Key? key,
    required this.singleLaunchData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleListModallaunchDataBuilder(
          singleLaunchData: singleLaunchData,
        ),
        const SingleListModalRocketDataBuilder(),
        const SingleListModallaunchPadDataBuilder(),
      ],
    );
  }
}
