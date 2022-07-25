import 'package:flutter/material.dart';

import 'core/routes/route_screen_map.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routeScreenMap,
    );
  }
}
