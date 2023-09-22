import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../constants/enums.dart';
import 'app_card_ripple.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final AppButtonType? appButtonType;
  final Function? onPressed;
  final Color? background;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;

  const AppButton(
      {Key? key,
      required this.text,
      this.height,
      this.width,
      this.fontWeight,
      this.textColor,
      this.background,
      this.fontSize,
      required this.onPressed,
      this.appButtonType = AppButtonType.NORMAL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCardRipple(
      onClicked: () {
        onPressed?.call();
      },
      child: Container(
        height: height ?? 60.h,
        width: width ?? ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(10.r),
          gradient: background != null
              ? null
              : appButtonType == AppButtonType.NORMAL
                  ? LinearGradient(colors: [
                      AppColors.appColor,
                      AppColors.appColor.withOpacity(0.6),
                    ])
                  : LinearGradient(
                      colors: [
                        AppColors.appColor,
                        AppColors.appColor.withOpacity(0.5),
                      ],
                    ),
        ),
        child: Center(
          child: AppText(
            text,
            style: TextStyle(
              fontWeight: fontWeight,
              fontFamily: AppFonts.appFont,
              color: textColor ??
                  (appButtonType == AppButtonType.NORMAL
                      ? Colors.white
                      : AppColors.appColor),
              fontSize:
                  fontSize ?? (appButtonType == AppButtonType.NORMAL ? AppFonts.s20 : AppFonts.s16),
            ),
          ),
        ),
      ),
    );
  }
}
