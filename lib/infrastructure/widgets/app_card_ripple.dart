import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCardRipple extends StatelessWidget {
  final Widget child;
  final Function onClicked;
  final double? topLeftR;
  final double? topRightR;
  final double? bottomLeftR;
  final double? bottomRightR;

  const AppCardRipple(
      {super.key,
      this.topLeftR,
      this.topRightR,
      this.bottomLeftR,
      this.bottomRightR,
      required this.child,
      required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftR != null ? topLeftR! : 12.w),
            topRight: Radius.circular(topRightR != null ? topRightR! : 12.w),
            bottomLeft: Radius.circular(bottomLeftR != null ? bottomLeftR! : 12.h),
            bottomRight: Radius.circular(bottomRightR != null ? bottomRightR! : 12.h),
          ),
          onTap: () {
            onClicked.call();
          },
          child: child),
    );
  }
}
