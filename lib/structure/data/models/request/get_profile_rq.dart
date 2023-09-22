


import 'package:rapexa_academy/infrastructure/network/base/base_rq.dart';

class ProfileRq extends Rq{

  String? username;
  String? password;

  ProfileRq({this.username, this.password});

  Map<String, dynamic> toJson(){
    return {
      "username": username,
      "password": password,
    };
  }

}