import 'package:flutter/material.dart';
import 'package:space_x/core/constants/button_style_constant.dart';
import 'package:space_x/core/constants/padding_constant.dart';
import 'package:space_x/core/constants/style_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleListModalRocketWebsiteLink extends StatelessWidget {
  final String websiteLink;
  const SingleListModalRocketWebsiteLink({
    Key? key,
    required this.websiteLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri siteUrl = Uri.parse(websiteLink);

    Future<void> _launchUrl() async {
      if (!await launchUrl(siteUrl)) {
        throw 'Could not launch $siteUrl';
      }
    }

    return Container(
      padding: commonSistersWidgetPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: commonSingleModalInfoPadding,
            child: Text(
              "Additional info link",
              style: commonSingleModalInfoHeader,
            ),
          ),
          TextButton(
            style: noPaddingTextButtonStyle,
            onPressed: () {
              _launchUrl();
            },
            child: const Text("View website"),
          ),
        ],
      ),
    );
  }
}
