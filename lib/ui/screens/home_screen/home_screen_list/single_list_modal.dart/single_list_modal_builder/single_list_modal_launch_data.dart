import 'package:flutter/material.dart';
import 'package:space_x/core/model/upcoming_launch_model/upcoming_launch_model.dart';

import 'package:space_x/core/utils/date_format.dart';
import 'package:space_x/ui/screens/home_screen/home_screen_list/single_list_modal.dart/single_list_modal_builder/single_list_modal_component/single_list_modal_panel.dart';

import 'single_list_modal_component/single_list_modal_singular_info.dart';

class SingleListModalLaunchDataBuilder extends StatelessWidget {
  final UpcomingLaunchData singleLaunchData;
  const SingleListModalLaunchDataBuilder({
    Key? key,
    required this.singleLaunchData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomDateFormat dateFormat = CustomDateFormat();

    String localTime = dateFormat.processDateTimeToReadable(
      rawStringDate: singleLaunchData.date_local!,
    );

    return SingleListModalPanel(
      panelTitle: "Launch Information",
      columnWidgets: [
        SingleListModalSingularInfo(
          header: "Launch name",
          body: singleLaunchData.name!,
        ),
        SingleListModalSingularInfo(
          header: "Launch Local time",
          body: localTime,
        ),
        SingleListModalSingularInfo(
          header: "Launch detail",
          body: singleLaunchData.details,
        ),
        SingleListModalSingularInfo(
          header: "Launch flight number",
          body: singleLaunchData.flight_number.toString(),
        ),
        SingleListModalSingularInfo(
          header: "Launch library ID",
          body: singleLaunchData.launch_library_id,
        ),
      ],
    );
  }
}
