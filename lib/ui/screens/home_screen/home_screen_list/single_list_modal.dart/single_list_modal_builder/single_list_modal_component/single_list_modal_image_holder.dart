import 'package:flutter/material.dart';
import 'package:space_x/core/constants/padding_constant.dart';
import 'package:space_x/ui/widgets/common_widgets/common_circular_loading.dart';

class SingleListModalImageHolder extends StatelessWidget {
  const SingleListModalImageHolder({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: commonSingleModalPanelPadding,
      child: Image.network(
        imageURL,
        errorBuilder: (context, object, stackTrace) =>
            Container(), //Showing an empty holder
        loadingBuilder: (
          BuildContext context,
          Widget child,
          ImageChunkEvent? loadingProgress,
        ) {
          if (loadingProgress == null) {
            return child;
          }

          return const CommonCircularLoading();
        },
      ),
    );
  }
}
