


import 'package:dio/dio.dart';
import 'package:rapexa_academy/infrastructure/network/base/base_rq.dart';

class LoginWithPasswordRq extends Rq{

  String? username;
  String? password;

  LoginWithPasswordRq({this.username, this.password});

  FormData toJson(){
    return FormData.fromMap({
      "user": username,
      "countrycode": "+98",
      "password": password,
    });
  }

}