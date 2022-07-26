import 'package:flutter/material.dart';
import 'package:space_x/core/constants/padding_constant.dart';
import 'package:space_x/core/constants/style_constant.dart';

class SingleListModalSingularInfo extends StatelessWidget {
  const SingleListModalSingularInfo({
    Key? key,
    required this.header,
    this.body,
  }) : super(key: key);

  final String header;
  final String? body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: commonSistersWidgetPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: commonSingleModalInfoPadding,
            child: Text(
              header,
              style: commonSingleModalInfoHeader,
            ),
          ),
          Text(
            body ?? "No data available",
            style: commonSingleModalInfoBody,
          ),
        ],
      ),
    );
  }
}
