


import 'package:dio/dio.dart';
import 'package:rapexa_academy/infrastructure/network/base/base_rq.dart';

class ForgotPasswordRq extends Rq{

  String? username;
  String? password;
  String? otp;

  ForgotPasswordRq({this.username, this.password, this.otp});

  FormData toJson(){
    return FormData.fromMap({
      "user": username,
      "countrycode": "+98",
      "password": password,
      "otp": otp,
    });
  }

}