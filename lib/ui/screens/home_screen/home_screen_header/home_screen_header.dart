import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/core/constants/padding_constant.dart';
import 'package:space_x/core/constants/style_constant.dart';
import 'package:space_x/core/providers/app_provider.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(
      context,
      listen: false,
    );

    //Get the current date:
    String currentTimeInUnix = provider.getQueryTimeRangeForDisplay();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: commonSistersWidgetPaddingSmall,
          child: Text(
            "SpaceX Launch",
            style: commonHeaderTextStyle,
          ),
        ),
        Text(
          currentTimeInUnix,
          style: commonSubheaderTextStyle,
        ),
      ],
    );
  }
}
