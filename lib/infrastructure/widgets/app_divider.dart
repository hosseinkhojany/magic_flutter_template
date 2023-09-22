
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDivider extends StatelessWidget{
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: Container(
          color: Colors.black.withOpacity(0.2),
          width: ScreenUtil().screenWidth,
          height: 1,
        ),
    );
  }
}