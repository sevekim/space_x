import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/core/model/launchpad_data_model/launchpad_data_model.dart';
import 'package:space_x/core/providers/app_provider.dart';

import 'single_list_modal_component/single_list_modal_panel.dart';
import 'single_list_modal_component/single_list_modal_singular_info.dart';

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

    LaunchPadData dataFromDoc = LaunchPadData.fromDoc(
      launchPadData,
    );

    return SingleListModalPanel(
      panelTitle: "Launch Pad Information",
      columnWidgets: [
        SingleListModalSingularInfo(
          header: "ID",
          body: dataFromDoc.id!,
        ),
        SingleListModalSingularInfo(
          header: "Name",
          body: dataFromDoc.name,
        ),
        SingleListModalSingularInfo(
          header: "Full name",
          body: dataFromDoc.full_name,
        ),
        SingleListModalSingularInfo(
          header: "Launch pad success/attempts",
          body: "${dataFromDoc.launchSuccesses}/${dataFromDoc.launchAttempts}",
        ),
        SingleListModalSingularInfo(
          header: "Launch pad locality",
          body: dataFromDoc.locality,
        ),
        SingleListModalSingularInfo(
          header: "Launch pad status",
          body: dataFromDoc.status,
        ),
        SingleListModalSingularInfo(
          header: "Description",
          body: dataFromDoc.details,
        ),
      ],
    );
  }
}
