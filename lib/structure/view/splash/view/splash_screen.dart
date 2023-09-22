import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';
import 'package:rapexa_academy/infrastructure/constants/routes.dart';
import 'package:rapexa_academy/infrastructure/widgets/base_page.dart';
import 'package:rapexa_academy/structure/data/datasources/local/shared_store.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 4500), (){
        if (SharedStore.getUser() != null) {
          Get.offNamedUntil(NAVIGATION_ROUTE, (route) => false);
        } else {
          Get.offNamedUntil(LOGIN_ROUTE, (route) => false);
        }
      });
    });
    return BasePage(
        child: GifView.asset(
            'assets/images/splash1.gif',
            fit: BoxFit.cover,
            controller: GifController(loop: false),
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
            frameRate: 20, // default is 15 FPS
        ));
  }
}
