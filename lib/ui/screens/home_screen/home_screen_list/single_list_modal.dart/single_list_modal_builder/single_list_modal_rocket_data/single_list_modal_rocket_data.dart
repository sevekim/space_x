import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/core/providers/app_provider.dart';

import '../../../../../../../core/model/rocket_data_model/rocket_data_model.dart';
import '../single_list_modal_component/single_list_modal_image_holder.dart';
import '../single_list_modal_component/single_list_modal_panel.dart';
import '../single_list_modal_component/single_list_modal_singular_info.dart';
import 'single_list_modal_rocket_data_website_link.dart';

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

    RocketData dataFromDoc = RocketData.fromDoc(
      rocketData,
    );

    return SingleListModalPanel(
      panelTitle: "Rocket Information",
      columnWidgets: [
        dataFromDoc.flickrImages != null
            ? dataFromDoc.flickrImages!.isNotEmpty
                ? SingleListModalImageHolder(
                    imageURL: dataFromDoc.flickrImages![0],
                  )
                : Container()
            : Container(),
        SingleListModalSingularInfo(
          header: "ID",
          body: dataFromDoc.id!,
        ),
        SingleListModalSingularInfo(
          header: "Name",
          body: dataFromDoc.name,
        ),
        SingleListModalSingularInfo(
          header: "Description",
          body: dataFromDoc.description,
        ),
        dataFromDoc.wikipedia != null
            ? SingleListModalRocketWebsiteLink(
                websiteLink: dataFromDoc.wikipedia!,
              )
            : Container(),
      ],
    );
  }
}
