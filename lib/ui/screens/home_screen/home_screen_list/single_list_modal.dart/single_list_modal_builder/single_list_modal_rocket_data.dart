import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/core/providers/app_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/model/rocket_data_model/rocket_data_model.dart';

class SingleListModalRocketDataBuilder extends StatelessWidget {
  const SingleListModalRocketDataBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(
      context,
      listen: false,
    );

    Map<String, dynamic> rocketData = provider.rocketData;

    RocketData data = RocketData.fromDoc(
      rocketData,
    );

    final Uri _url = Uri.parse(data.wikipedia ?? "https://www.spacex.com/");

    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }
    }

    return Card(
      child: ListTile(
        title: Container(
          padding: const EdgeInsets.only(
            top: 10.0,
          ),
          child: const Text(
            "Rocket Information:",
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(
                data.name!,
              ),
            ),
            TextButton(
              child: Text(data.wikipedia!),
              onPressed: () {
                _launchUrl();
              },
            ),
          ],
        ),
      ),
    );
  }
}
