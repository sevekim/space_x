import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/core/model/upcoming_launch_model/upcoming_launch_model.dart';
import 'package:space_x/core/providers/app_provider.dart';
import 'package:space_x/ui/widgets/common_widgets/common_circular_loading.dart';

import 'single_list_modal_builder/single_list_modal_builder.dart';

class HomeScreenSingleListModalSelector extends StatelessWidget {
  final ScrollController scrollController;
  final UpcomingLaunchData singleLaunchData;
  const HomeScreenSingleListModalSelector({
    Key? key,
    required this.scrollController,
    required this.singleLaunchData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<AppProvider, bool>(
      selector: (buildContext, selectorProvider) =>
          selectorProvider.isSingleLaunchDataLoaded,
      builder: (_, isSingleLaunchDataLoaded, __) {
        return !isSingleLaunchDataLoaded
            ? const CommonCircularLoading()
            : SingleListModalBuilder(
                singleLaunchData: singleLaunchData,
              );
      },
    );
  }
}
