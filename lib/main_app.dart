import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/core/providers/app_provider.dart';

import 'core/routes/route_screen_map.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(
      context,
      listen: false,
    );

    //Initiate the data fetch
    provider.getInitialData(
      context: context,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routeScreenMap,
    );
  }
}
