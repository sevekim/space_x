import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/core/constants/padding_constant.dart';
import 'package:space_x/core/model/launchpad_data_model/launchpad_data_model.dart';
import 'package:space_x/core/providers/app_provider.dart';

class SingleListModallaunchPadDataBuilder extends StatelessWidget {
  const SingleListModallaunchPadDataBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(
      context,
      listen: false,
    );

    Map<String, dynamic> launchPadData = provider.launchPadData;

    LaunchPadData data = LaunchPadData.fromDoc(
      launchPadData,
    );

    return Card(
      child: ListTile(
        title: Container(
          padding: const EdgeInsets.only(
            top: 10.0,
          ),
          child: const Text(
            "Launch pad information:",
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: commonSistersWidgetPadding,
              child: Text(
                "Launch pad name: " + data.name!,
              ),
            ),
            Container(
              padding: commonSistersWidgetPadding,
              child: Text(
                "Launch pad name: " + data.full_name!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
