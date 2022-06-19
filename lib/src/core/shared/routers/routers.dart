import 'package:flutter/material.dart';

import '../../../modules/credit/router/credit_router.dart';

class Routers {
  static String get initialRoute => '/credit';

  static Map<String, Widget Function(BuildContext, dynamic)> routes = {
    '/credit': (_, __) => const CreditRouter(),
  };

  static Route? generateRoutes(RouteSettings settings) {
    final routerName = settings.name;
    final routerArgs = settings.arguments;

    final navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}
