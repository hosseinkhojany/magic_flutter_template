import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rapexa_academy/infrastructure/constants/app_fonts.dart';
import 'package:rapexa_academy/infrastructure/constants/app_images.dart';
import 'package:rapexa_academy/infrastructure/constants/routes.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_button.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_text.dart';
import 'package:rapexa_academy/infrastructure/widgets/base_page.dart';
import 'package:rapexa_academy/structure/presenter/login_controller.dart';
import '../../../infrastructure/constants/app_colors.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {

  int selectedTabBar = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this, initialIndex: selectedTabBar);
    tabController.addListener(() {
      setState(() {
      });
    });

  }

  @override
  Widget build(BuildContext context) {

  return GetBuilder<LoginController>(
    autoRemove: false,
    builder: (controller) {
      return BasePage(
          appBar: AppBar(
            backgroundColor: AppColors.appColor,
            title: AppText("خوش آمدید!"),),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    AppImages.appImage,
                    height: 200.h,
                    width: 200.w,
                  ),
                ),
                TabBar(
                    controller: tabController,
                    tabs: [
                  Container(height: 50.h, width: 200.w, child: Center(child: AppText("ورود با رمزعبور", color: Colors.black,)),),
                  Container(height: 50.h, width: 200.w, child: Center(child: AppText("ورود با کد پیامکی", color: Colors.black)),),
                ]),
                SizedBox(
                  height: 335.h,
                  child: TabBarView(
                      controller: tabController,
                      children: [
                        loginWithPassword(controller),
                        loginWithOtpCode(controller)
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 40.w, left: 40.w, bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          Get.toNamed(REGISTER_ROUTE);
                        },
                        child: AppText(
                          "ثبت نام",
                          style: TextStyle(
                            fontFamily: AppFonts.appFont,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            decorationThickness: 2,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: AppText(
                          "شرایط و حریم خصوصی",
                          style: TextStyle(
                            fontFamily: AppFonts.appFont,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            decorationThickness: 2,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
    }
  );
  }

  Widget loginWithPassword(LoginController controller){
    return Padding(
      padding: EdgeInsets.all(30.r),
        child: Container(
          height: 327.h,
          width: ScreenUtil().screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          padding: EdgeInsets.all(20.r),
          child: Column(
            children: [
              TextField(
                controller: controller.username,
                decoration: const InputDecoration(
                  hintText: "نام کاربری",
                  prefixIcon: Icon(Icons.phone_android),
                ),
              ),
              SizedBox(height: 15.h),
              TextField(
                controller: controller.password,
                decoration: const InputDecoration(
                  hintText: "رمز عبور",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 25.h),
              AppButton(
                text: "ورود",
                onPressed: () {
                  Get.find<LoginController>().loginWithPassword();
                },
                fontSize: AppFonts.s16,
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: (){
                  Get.toNamed(FORGOT_PASSWORD_ROUTE);
                },
                child: const AppText(
                  "بازیابی رمز عبور",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    decorationThickness: 2,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

  Widget loginWithOtpCode(LoginController controller){
    return Padding(
      padding: EdgeInsets.all(30.r),
        child: Container(
          height: 100.h,
          width: ScreenUtil().screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          padding: EdgeInsets.all(20.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.username,
                decoration: const InputDecoration(
                  hintText: "نام کاربری",
                  prefixIcon: Icon(Icons.phone_android),
                ),
              ),
              SizedBox(height: 50.h),
              AppButton(
                text: "ارسال کد",
                onPressed: () {
                  controller.sendOtp("login");
                },
                fontSize: AppFonts.s16,
              )
            ],
          ),
        ),
      );
  }

}
