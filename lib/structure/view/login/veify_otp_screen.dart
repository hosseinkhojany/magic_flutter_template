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


class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _VerifyScreenState();
  }
}

class _VerifyScreenState extends State<VerifyScreen> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      autoRemove: false,
      builder: (controller) {
        return BasePage(
          appBar: AppBar(
            backgroundColor: AppColors.appColor,
            title: AppText("اعتبار سنجی کد فعال سازی"),),
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
                          controller: controller.otp,
                          decoration: const InputDecoration(
                            hintText: "کد ۶ رقمی",
                            prefixIcon: Icon(Icons.code),
                          ),
                        ),
                        SizedBox(height: 25.h),
                        AppButton(
                          text: "تایید",
                          onPressed: () {
                            controller.verifyOtp();
                          },
                          fontSize: AppFonts.s16,
                        )
                      ],
                    ),
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
