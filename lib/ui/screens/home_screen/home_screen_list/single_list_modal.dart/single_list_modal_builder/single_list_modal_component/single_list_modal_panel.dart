import 'package:flutter/material.dart';
import 'package:space_x/core/constants/padding_constant.dart';
import 'package:space_x/core/constants/style_constant.dart';

class SingleListModalPanel extends StatelessWidget {
  final String panelTitle;
  final List<Widget> columnWidgets;
  const SingleListModalPanel({
    Key? key,
    required this.panelTitle,
    required this.columnWidgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: commonSistersWidgetPadding,
      child: Card(
        child: Container(
          padding: commonSingleModalPanelPadding,
          child: ListTile(
            title: Container(
              padding: commonSistersWidgetPadding,
              child: Text(
                panelTitle,
                style: commonSingleModalPanelHeader,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: columnWidgets,
            ),
          ),
        ),
      ),
    );
  }
}
