import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapexa_academy/infrastructure/constants/routes.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_snackbar.dart';
import 'package:rapexa_academy/structure/data/models/request/forgot_password_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/login_with_otp_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/login_with_password_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/register_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/send_otp_rq.dart';
import 'package:rapexa_academy/structure/domain/usecases/login_usecase.dart';

class LoginController extends GetxController {
  LoginUseCase useCase;

  TextEditingController username = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  String typeOfVerifyOtp = "";

  LoginController(this.useCase);

  void loginWithPassword() {
    if (username.text.isNotEmpty && password.text.isNotEmpty) {
    } else {
      AppSnackBar.showError("نام کاربری یا رمز عبور نباید خالی باشد!");
      return;
    }
    useCase.loginWithPassword(
      LoginWithPasswordRq(username: username.text, password: password.text),
      loading: () {
        AppSnackBar.showLoading();
      },
      error: (error) async {
        AppSnackBar.showError(error.message);
        await AppSnackBar.dismissLoading();
      },
      success: (rp) {
        AppSnackBar.dismissLoading();
        Get.offNamedUntil(NAVIGATION_ROUTE, (route) => false);
      },
    );
  }

  void loginWithOtp() {
    useCase.loginWithOtp(
      LoginWithOtpRq(username: username.text, otp: otp.text),
      loading: () {
        AppSnackBar.showLoading();
      },
      error: (error) async {
        AppSnackBar.showError(error.message);
        await AppSnackBar.dismissLoading();
      },
      success: (rp) {
        AppSnackBar.dismissLoading();
        Get.offNamedUntil(NAVIGATION_ROUTE, (route) => false);
      },
    );
  }

  void sendOtp(String type) {
    if (type == "login") {
      if (username.text.isNotEmpty) {
      } else {
        AppSnackBar.showError("نام کاربری نباید خالی باشد!");
        return;
      }
    } else if (type == "register") {
      if (name.text.isNotEmpty &&
          username.text.isNotEmpty &&
          rePassword.text.isNotEmpty &&
          email.text.isNotEmpty &&
          password.text.isNotEmpty) {
        if (password.text != rePassword.text) {
          AppSnackBar.showError("رمز عبور و تکرار ان یکسان نیست!");
          return;
        }
      } else {
        AppSnackBar.showError("تمام فیلد ها به درستی پر نشده است!");
        return;
      }
    } else if (type == "resetpass") {
      if (username.text.isNotEmpty &&
          password.text.isNotEmpty &&
          rePassword.text.isNotEmpty) {
        if (password.text != rePassword.text) {
          AppSnackBar.showError("رمز عبور و تکرار ان یکسان نیست!");
          return;
        }
      } else {
        AppSnackBar.showError("تمام فیلد ها به درستی پر نشده است!");
        return;
      }
    }
    typeOfVerifyOtp = type;
    useCase.sendOtp(
      SendOtpRq(phone: username.text, type: type),
      loading: () {
        AppSnackBar.showLoading();
      },
      error: (error) async {
        AppSnackBar.showError(error.message);
        await AppSnackBar.dismissLoading();
      },
      success: (rp) {
        AppSnackBar.dismissLoading();
        Get.toNamed(VERIFY_OTP_ROUTE);
      },
    );
  }

  void verifyOtp() {
    if (otp.text.isEmpty) {
      AppSnackBar.showError("کد فعال سازی را وارد نشده است!");
      return;
    }
    if (typeOfVerifyOtp == "register") {
      register();
    } else if (typeOfVerifyOtp == "login") {
      loginWithOtp();
    } else if (typeOfVerifyOtp == "resetpass") {
      forgotPassword();
    }
  }

  void forgotPassword() {
    useCase.forgotPass(
      ForgotPasswordRq(username: username.text, password: password.text, otp: otp.text),
      loading: () {
        AppSnackBar.showLoading();
      },
      error: (error) async {
        AppSnackBar.showError(error.message);
        await AppSnackBar.dismissLoading();
      },
      success: (rp) {
        AppSnackBar.dismissLoading();
        Get.offNamedUntil(NAVIGATION_ROUTE, (route) => false);
      },
    );
  }

  void register() {
    useCase.registerUser(
      RegisterRq(
          digits_reg_username: username.text,
          digits_reg_countrycode: "+98",
          digits_reg_mobile: username.text,
          digits_reg_name: name.text,
          digits_reg_email: email.text,
          digits_reg_password: password.text,
          otp: otp.text),
      loading: () {
        AppSnackBar.showLoading();
      },
      error: (error) async {
        AppSnackBar.showError(error.message);
        await AppSnackBar.dismissLoading();
        loginWithPassword();
      },
      success: (rp) {
        AppSnackBar.dismissLoading();
        Get.offNamedUntil(NAVIGATION_ROUTE, (route) => false);
      },
    );
  }

  void logout() {
    useCase.logout(
      loading: () {
        AppSnackBar.showLoading();
      },
      error: (error) async {
        AppSnackBar.showError(error.message);
        await AppSnackBar.dismissLoading();
      },
      success: (rp) {
        AppSnackBar.dismissLoading();
        Get.offNamedUntil(SPLASH_ROUTE, (route) => false);
      },
    );
  }
}
