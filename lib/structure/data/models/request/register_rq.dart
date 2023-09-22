import 'package:dio/dio.dart';
import 'package:rapexa_academy/infrastructure/network/base/base_rq.dart';

class RegisterRq extends Rq {
  String? digits_reg_name;
  String? digits_reg_countrycode;
  String? digits_reg_mobile;
  String? digits_reg_password;
  String? digits_reg_username;
  String? digits_reg_email;
  String? otp;

  RegisterRq(
      {this.digits_reg_username,
      this.digits_reg_countrycode,
      this.digits_reg_mobile,
      this.digits_reg_name,
      this.digits_reg_email,
      this.digits_reg_password,
        this.otp});


  FormData toJson(){
    return FormData.fromMap({
      "digits_reg_name": digits_reg_name,
      "digits_reg_countrycode": digits_reg_countrycode,
      "digits_reg_mobile": digits_reg_mobile,
      "digits_reg_username": digits_reg_username,
      "digits_reg_email": digits_reg_email,
      "digits_reg_password": digits_reg_password,
      "otp": otp,
    });
  }

}
