import 'package:flutter/material.dart';
import 'package:rapexa_academy/structure/view/home/view/product_detail_screen.dart';
import 'package:rapexa_academy/structure/view/login/forogt_password_screen.dart';
import 'package:rapexa_academy/structure/view/login/login_screen.dart';
import 'package:rapexa_academy/structure/view/login/register_screen.dart';
import 'package:rapexa_academy/structure/view/login/veify_otp_screen.dart';
import 'package:rapexa_academy/structure/view/navigation/view/navigation_screen.dart';
import 'package:rapexa_academy/structure/view/posts/post_details_screen.dart';
import 'package:rapexa_academy/structure/view/posts/post_screen.dart';
import 'package:rapexa_academy/structure/view/splash/view/splash_screen.dart';

import '../on_linked_vars.dart';
import 'enums.dart';

const String SPLASH_ROUTE = "/";
const String NAVIGATION_ROUTE  = "/HOME_ROUTE";
const String LOGIN_ROUTE  = "/LOGIN";
const String FORGOT_PASSWORD_ROUTE  = "/FORGOT_PASSWORD_ROUTE";
const String REGISTER_ROUTE = "/REGISTER_ROUTE";
const String VERIFY_OTP_ROUTE = "/VERIFY_OTP_ROUTE";
const String POST_ROUTE  = "/BLOGS_ROUTE";
const String POST_DETAIL_ROUTE  = "/BLOG_DETAIL_ROUTE";
const String PRODUCT_DETAIL_ROUTE  = "/PRODUCT_DETAIL_ROUTE";

Map<String, Widget Function(BuildContext)> getAppRoutes() {
  Map<String, Widget Function(BuildContext)> routes = {};
  if (currentAppFlavor == Flavor.MAIN) {
    routes.addEntries({
      SPLASH_ROUTE: (context) => const SplashScreen(),
      LOGIN_ROUTE: (context) => const LoginScreen(),
      FORGOT_PASSWORD_ROUTE: (context) => const ForgotPasswordScreen(),
      REGISTER_ROUTE: (context) => const RegisterScreen(),
      PRODUCT_DETAIL_ROUTE: (context) => const ProductDetailScreen(),
      NAVIGATION_ROUTE: (context) => const NavigationScreen(),
      POST_ROUTE: (context) => const PostScreen(),
      POST_DETAIL_ROUTE: (context) => const PostDetailScreen(),
      VERIFY_OTP_ROUTE: (context) => const VerifyScreen(),
    }.entries);
  }
  return routes;
}

// List<GetPage> getAppRoutes() {
//   return [
//     GetPage(name: SPLASH_ROUTE, page: () => const SplashScreen()),
//     GetPage(name: LOGIN_ROUTE, page: () => const LoginScreen()),
//     GetPage(name: FORGOT_PASSWORD_ROUTE, page: () => const ForgotPasswordScreen()),
//     GetPage(name: OTP_SCREEN_ROUTE, page: () => const OtpScreen()),
//     GetPage(name: REGISTER_ROUTE, page: () => const RegisterScreen()),
//     GetPage(name: PRODUCT_DETAIL_ROUTE, page: () => const ProductDetailScreen()),
//     GetPage(name: NAVIGATION_ROUTE, page: () => const NavigationScreen()),
//     GetPage(name: POST_ROUTE, page: () => const PostScreen()),
//     GetPage(name: POST_DETAIL_ROUTE, page: () => const PostDetailScreen()),
//   ];
// }