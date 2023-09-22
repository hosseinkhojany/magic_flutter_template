import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';

class SendOtpRp extends BaseRp {
  int? accountkit;
  int? firebase;
  String? code;

  SendOtpRp({this.accountkit, this.firebase, this.code});

  SendOtpRp.fromJson(Map<String, dynamic> json) {
    accountkit = json['accountkit'];
    firebase = json['firebase'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountkit'] = this.accountkit;
    data['firebase'] = this.firebase;
    data['code'] = this.code;
    return data;
  }
}