import 'package:flutter/material.dart';

import 'core/shared/consts/app_colors_const.dart';
import 'core/shared/routers/routers.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:
            const MaterialColor(0xFF36908E, AppColorsConst.mapPrimary),
      ),
      initialRoute: Routers.initialRoute,
      onGenerateRoute: Routers.generateRoutes,
    );
  }
}
