


import 'package:dio/dio.dart';
import 'package:rapexa_academy/infrastructure/network/base/base_rq.dart';

class SendOtpRq extends Rq{

  String? phone;
  String? type;

  SendOtpRq({this.phone, this.type});

  FormData toJson(){
    return FormData.fromMap({
      "countrycode": "+98",
      "type": type,
      "mobileNo": phone,
    });
  }
}