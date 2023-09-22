import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rapexa_academy/infrastructure/constants/app_fonts.dart';
import 'package:rapexa_academy/infrastructure/constants/app_images.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_button.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_text.dart';
import 'package:rapexa_academy/infrastructure/widgets/base_page.dart';
import 'package:rapexa_academy/structure/presenter/login_controller.dart';

import '../../../infrastructure/constants/app_colors.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      autoRemove: false,
      builder: (controller) {
        return BasePage(
          appBar: AppBar(
            backgroundColor: AppColors.appColor,
            title: AppText("ثبت نام"),),
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
                Padding(
                  padding: EdgeInsets.all(30.r),
                  child: Container(
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
                    width: ScreenUtil().screenWidth,
                    padding: EdgeInsets.all(20.r),
                    child: Column(
                      children: [
                        TextField(
                          controller: controller.name,
                          decoration: const InputDecoration(
                            hintText: "نام",
                            prefixIcon: Icon(Icons.drive_file_rename_outline),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        TextField(
                          controller: controller.username,
                          decoration: const InputDecoration(
                            hintText: "شماره تماس",
                            prefixIcon: Icon(Icons.phone_android),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        TextField(
                          controller: controller.email,
                          decoration: const InputDecoration(
                            hintText: "ایمیل",
                            prefixIcon: Icon(Icons.alternate_email_outlined),
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
                        SizedBox(height: 15.h),
                        TextField(
                          controller: controller.rePassword,
                          decoration: const InputDecoration(
                            hintText: "تکرار رمزعبور",
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                        SizedBox(height: 25.h),
                        AppButton(
                          text: "مرحله بعدی",
                          onPressed: () {
                            controller.sendOtp("register");
                          },
                          fontSize: AppFonts.s16,
                        )
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(right: 40.w, left: 40.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          Get.back();
                        },
                        child: AppText(
                          "ورود",
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
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      }
    );
  }
}
