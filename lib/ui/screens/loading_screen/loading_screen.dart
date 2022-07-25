import 'package:flutter/material.dart';
import 'package:space_x/ui/widgets/common_widgets/common_circular_loading.dart';

class AppStreamLoadingScreen extends StatelessWidget {
  const AppStreamLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CommonCircularLoading(),
      ),
    );
  }
}
