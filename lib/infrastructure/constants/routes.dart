import 'package:flutter/material.dart';
import 'package:rapexa_academy/structure/view/home/view/home_screen.dart';
import 'package:rapexa_academy/structure/view/splash/view/splash_screen.dart';

import '../on_linked_vars.dart';
import 'enums.dart';

const String SPLASH_ROUTE = "/";
const String HOME_ROUTE = "/HOME_ROUTE";

Map<String, Widget Function(BuildContext)> getAppRoutes() {
  Map<String, Widget Function(BuildContext)> routes = {};
  if (currentAppFlavor == Flavor.MAIN) {
    routes.addEntries({
      SPLASH_ROUTE: (context) => const SplashScreen(),
    }.entries);
  }
  routes.addEntries({
    HOME_ROUTE: (context) => const HomeScreen(),
  }.entries);
  return routes;
}
