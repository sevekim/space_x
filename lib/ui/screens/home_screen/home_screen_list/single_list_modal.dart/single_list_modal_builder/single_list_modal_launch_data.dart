import 'package:flutter/material.dart';
import 'package:space_x/core/constants/padding_constant.dart';
import 'package:space_x/core/model/upcoming_launch_model/upcoming_launch_model.dart';

import 'package:space_x/core/utils/date_format.dart';

class SingleListModallaunchDataBuilder extends StatelessWidget {
  final UpcomingLaunchData singleLaunchData;
  const SingleListModallaunchDataBuilder({
    Key? key,
    required this.singleLaunchData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomDateFormat dateFormat = CustomDateFormat();

    String utcTime = dateFormat.processDateTimeToReadable(
      rawStringDate: singleLaunchData.date_utc!,
    );

    String localTime = dateFormat.processDateTimeToReadable(
      rawStringDate: singleLaunchData.date_local!,
    );

    return Card(
      child: ListTile(
        title: Container(
          padding: const EdgeInsets.only(
            top: 10.0,
          ),
          child: const Text(
            "Launch Information:",
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 8,
              ),
              child: Text(
                "Launch name: ${singleLaunchData.name!}",
              ),
            ),
            Container(
              padding: commonSistersWidgetPadding,
              child: Text(
                "UTC time: $utcTime",
              ),
            ),
            Container(
              padding: commonSistersWidgetPadding,
              child: Text(
                "Local time: $localTime",
              ),
            ),
            Container(
              padding: commonSistersWidgetPadding,
              child: Text(
                "Launch detail: ${singleLaunchData.details}",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
