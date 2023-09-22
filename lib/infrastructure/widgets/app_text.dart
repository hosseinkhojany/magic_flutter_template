import 'package:flutter/cupertino.dart';

import '../constants/app_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? textOverflow;

  const AppText(
    this.text, {
    super.key,
    this.style,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      textDirection: textDirection,
      style: style ??
          TextStyle(
              fontFamily: AppFonts.appFont,
              fontSize: fontSize,
              color: color,
              overflow: textOverflow,
              fontWeight: fontWeight),
    );
  }
}
