import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:native_toast/native_toast.dart';
import 'package:rapexa_academy/infrastructure/widgets/toasting/overlay.dart';

class AppSnackBar {
  static showSuccess(String? message) {
    if (message != null) {
      if(Platform.isAndroid){
        NativeToast().makeText(
          message: message,
          duration: NativeToast.shortLength,
        ).ignore();
      }else{
        showOverlay((context, t) {
          return IosStyleToast(value: t, text: message, toastType: ToastType.success);
        }, key: ValueKey('hello'), duration: Duration(seconds: 3), curve: Curves.ease);
      }
    }
  }

  static showToast(String message) {
    showOverlay((context, t) {
      return IosStyleToast(value: t, text: message, toastType: ToastType.none);
    }, key: ValueKey('hello'), duration: Duration(seconds: 3), curve: Curves.ease);
  }

  static showError(String? message) {
    if (message != null) {
      if(Platform.isAndroid){
      NativeToast().makeText(
        message: message,
        duration: NativeToast.shortLength,
      ).ignore();
    }else{
        showOverlay((context, t) {
          return IosStyleToast(value: t, text: message, toastType: ToastType.error);
        }, key: ValueKey('hello'), duration: Duration(seconds: 3), curve: Curves.ease);
      }
    }
  }

  static showListError(List<String> messages) {
    for (var message in messages) {
      showError(message);
    }
  }

  static void showLoading() {
    // if (!EasyLoading.isShow) {
      EasyLoading.instance
        ..displayDuration = const Duration(milliseconds: 2000)
        ..loadingStyle = EasyLoadingStyle.light
        ..indicatorSize = 50.0.r
        ..radius = 10.0
      // ..progressColor = Colors.yellow
      // ..backgroundColor = Colors.green
      // ..indicatorColor = Colors.yellow
      // ..textColor = Colors.yellow
        ..maskColor = Colors.blue.withOpacity(0.5)
        ..userInteractions = false
        ..maskType = EasyLoadingMaskType.black
        ..dismissOnTap = false
        ..indicatorType = EasyLoadingIndicatorType.doubleBounce
        ..animationStyle = EasyLoadingAnimationStyle.scale;
      EasyLoading.show();
    // }
  }

  static Future dismissLoading() async {
    if (EasyLoading.isShow) {
      await EasyLoading.dismiss();
    }
  }
}

enum ToastType { success, error, none }

class IosStyleToast extends StatelessWidget {
  final double value;
  final ToastType toastType;

  static final Tween<Offset> tweenOffset =
      Tween<Offset>(begin: const Offset(0, 40), end: const Offset(0, 0));

  static final Tween<double> tweenOpacity = Tween<double>(begin: 0, end: 1);
  final String text;
  const IosStyleToast({Key? key, required this.text, required this.value, required this.toastType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: tweenOffset.transform(value),
      child: Opacity(
        opacity: tweenOpacity.transform(value),
        child: SafeArea(
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.black87,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        if (toastType == ToastType.success)
                          const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        if (toastType == ToastType.error)
                          const Icon(
                            Icons.error_outline_rounded,
                            color: Colors.white,
                          ),
                        Text(text)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
