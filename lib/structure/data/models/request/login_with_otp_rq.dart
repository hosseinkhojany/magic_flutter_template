


import 'package:dio/dio.dart';
import 'package:rapexa_academy/infrastructure/network/base/base_rq.dart';

class LoginWithOtpRq extends Rq{

  String? username;
  String? otp;

  LoginWithOtpRq({this.username,  this.otp});


  FormData toJson(){
    return FormData.fromMap({
      "user": username,
      "countrycode": "+98",
      "otp": otp,
    });
  }

}