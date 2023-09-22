import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rapexa_academy/infrastructure/constants/app_colors.dart';

import 'infrastructure/constants/app_themes.dart';
import 'infrastructure/constants/routes.dart';
import 'infrastructure/injector.dart';
import 'structure/data/datasources/local/shared_store.dart';
import 'infrastructure/widgets/toasting/overlay_state_finder.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SharedStore.init();
  // SharedStore.clearUserIdentity();
  AppColors.toggleColors();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode && !Platform.isAndroid && !Platform.isIOS,
      tools: DevicePreview.defaultTools,
      builder: (context) =>
      const OverlaySupport.global(
        child: App(),
      ),
    ),
  );
}


class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
          initialBinding: AppBinding(),
          darkTheme: AppThemes.dark,
          themeMode: SharedStore.getTheme() == "light" ? ThemeMode.light : ThemeMode.dark,
          theme: AppThemes.light,
          initialRoute: SPLASH_ROUTE,
          useInheritedMediaQuery: true,
          routes: getAppRoutes(),
          // getPages: getAppRoutes(),
          builder: EasyLoading.init()
      ),
    );
  }
}

