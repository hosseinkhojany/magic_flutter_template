import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rapexa_academy/infrastructure/constants/app_colors.dart';
import 'package:rapexa_academy/infrastructure/constants/app_fonts.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_card_ripple.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_text.dart';
import 'package:rapexa_academy/infrastructure/widgets/base_page.dart';
import 'package:rapexa_academy/structure/presenter/login_controller.dart';
import 'package:rapexa_academy/structure/presenter/product_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        autoRemove: false,
        builder: (controller) {
          return BasePage(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200.h,
                  width: ScreenUtil().screenWidth,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: AnimationConfiguration.synchronized(
                        child: ScaleAnimation(
                          scale: 0.90,
                          duration: const Duration(milliseconds: 200),
                          child: FadeInAnimation(
                            child: Container(
                              width: 150.r,
                              height: 150.r,
                              padding: EdgeInsets.all(0.r),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 8.0.r,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: Icon(
                                  Icons.account_circle_rounded,
                                  size: 140.r,
                                  color: AppColors.appColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 10.h),
                  child: AnimationConfiguration.synchronized(
                    child: ScaleAnimation(
                      scale: 0.90,
                      duration: const Duration(milliseconds: 200),
                      child: FadeInAnimation(
                        child: Container(
                          height: 130,
                          width: ScreenUtil().screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10.0.r,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(TextSpan(
                                  text: '',
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: 'نام: ',
                                      style: TextStyle(
                                          fontSize: AppFonts.s18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: AppFonts.appFont,
                                          color: Colors.black54),
                                    ),
                                    TextSpan(
                                      text: 'محمد',
                                      style: TextStyle(
                                          fontSize: AppFonts.s18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: AppFonts.appFont),
                                    )
                                  ],
                                )),
                                Divider(),
                                Text.rich(TextSpan(
                                  text: '',
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: 'شماره تماس: ',
                                      style: TextStyle(
                                          fontSize: AppFonts.s18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: AppFonts.appFont,
                                          color: Colors.black54),
                                    ),
                                    TextSpan(
                                      text: '+98931422440',
                                      style: TextStyle(
                                          fontSize: AppFonts.s18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: AppFonts.appFont),
                                    )
                                  ],
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 25.h),
                  child: AnimationConfiguration.synchronized(
                    child: ScaleAnimation(
                      scale: 0.90,
                      duration: const Duration(milliseconds: 200),
                      child: FadeInAnimation(
                        child: Container(
                          height: 90,
                          width: ScreenUtil().screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10.0.r,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: AppCardRipple(
                            onClicked: () {},
                            child: Padding(
                              padding: EdgeInsets.all(25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText("تماس با ما", fontSize: AppFonts.s16),
                                  Icon(Icons.support_agent_rounded, size: 35),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 20.h),
                  child: AnimationConfiguration.synchronized(
                    child: ScaleAnimation(
                      scale: 0.90,
                      duration: const Duration(milliseconds: 200),
                      child: FadeInAnimation(
                        child: Container(
                          height: 90,
                          width: ScreenUtil().screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10.0.r,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: AppCardRipple(
                            onClicked: () {},
                            child: Padding(
                              padding: EdgeInsets.all(25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText("دوره های من",
                                      fontSize: AppFonts.s16),
                                  Icon(Icons.add_card_outlined, size: 35),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 20.h),
                  child: AnimationConfiguration.synchronized(
                    child: ScaleAnimation(
                      scale: 0.90,
                      duration: const Duration(milliseconds: 200),
                      child: FadeInAnimation(
                        child: Container(
                          height: 90,
                          width: ScreenUtil().screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10.0.r,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: AppCardRipple(
                            onClicked: () {},
                            child: Padding(
                              padding: EdgeInsets.all(25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText("سفارش های من",
                                      fontSize: AppFonts.s16),
                                  Icon(Icons.add_chart, size: 35),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 20.h),
                  child: AnimationConfiguration.synchronized(
                    child: ScaleAnimation(
                      scale: 0.90,
                      duration: const Duration(milliseconds: 200),
                      child: FadeInAnimation(
                        child: Container(
                          height: 90,
                          width: ScreenUtil().screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10.0.r,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: AppCardRipple(
                            onClicked: () {
                              Get.find<LoginController>().logout();
                            },
                            child: Padding(
                              padding: EdgeInsets.all(25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    "خروج از حساب",
                                    fontSize: AppFonts.s16,
                                    color: Colors.redAccent,
                                  ),
                                  Icon(
                                    Icons.logout_rounded,
                                    size: 35,
                                    color: Colors.redAccent,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ));
        });
  }
}
