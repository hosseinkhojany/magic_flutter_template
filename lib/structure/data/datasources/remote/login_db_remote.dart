import 'package:dio/dio.dart';
import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';
import 'package:rapexa_academy/infrastructure/network/handle_error.dart';
import 'package:rapexa_academy/structure/data/models/request/forgot_password_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/login_with_otp_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/login_with_password_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/register_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/send_otp_rq.dart';
import 'package:rapexa_academy/structure/data/models/response/send_otp_rp.dart';

import '../../../../infrastructure/constants/endpoints.dart';
import '../../models/response/logins_and_forgot_and_register_rp.dart';

class LoginDataSourceRemote{

  final Dio _dio;
  LoginDataSourceRemote(this._dio);

  Future<BaseRp> loginWithOtp(LoginWithOtpRq rq) async {
    try{
      var response = await _dio.get(EndPoints.LOGIN, data: rq.toJson());
      if(HandleHttpError.checkResponseIsFailed(response)){
        return HandleHttpError.makeFailureFromResponse(response);
      }else{
        return LoginRp.fromJson(response.data);
      }
    }  on DioException catch (e) {
      return HandleHttpError.makeFailure(e);
    }
  }

  Future<BaseRp> loginWithPassword(LoginWithPasswordRq rq) async {
    try{
      var response = await _dio.post(EndPoints.LOGIN, data: rq.toJson());
      if(HandleHttpError.checkResponseIsFailed(response)){
        return HandleHttpError.makeFailureFromResponse(response);
      }else{
        return LoginRp.fromJson(response.data);
      }
    } on DioException catch (e) {
      return HandleHttpError.makeFailure(e);
    }
  }

  Future<BaseRp> sendOtp(SendOtpRq rq) async {
    try{
      var response = await _dio.post(EndPoints.SEND_OTP, data: rq.toJson());
      if(HandleHttpError.checkResponseIsFailed(response)){
        return HandleHttpError.makeFailureFromResponse(response);
      }else{
        return SendOtpRp.fromJson(response.data);
      }
    }  on DioException catch (e) {
      return HandleHttpError.makeFailure(e);
    }
  }

  Future<BaseRp> forgotPasswordOtp(ForgotPasswordRq rq) async {
    try{
      var response = await _dio.post(EndPoints.RECOVERY, data: rq.toJson());
      if(HandleHttpError.checkResponseIsFailed(response)){
        return HandleHttpError.makeFailureFromResponse(response);
      }else{
        return LoginRp.fromJson(response.data);
      }
    }  on DioException catch (e) {
      return HandleHttpError.makeFailure(e);
    }
  }

  Future<BaseRp> register(RegisterRq rq) async {
    try{
      var response = await _dio.post(EndPoints.CREATE_USER, data: rq.toJson());
      if(HandleHttpError.checkResponseIsFailed(response)){
        return HandleHttpError.makeFailureFromResponse(response);
      }else{
        return LoginRp.fromJson(response.data);
      }
    }  on DioException catch (e) {
      return HandleHttpError.makeFailure(e);
    }
  }

  Future<BaseRp> logout() async {
    try{
      var response = await _dio.post(EndPoints.LOGOUT);
      if(HandleHttpError.checkResponseIsFailed(response)){
        return HandleHttpError.makeFailureFromResponse(response);
      }else{
        return ZeroOneRp(true);
      }
    }  on DioException catch (e) {
      return HandleHttpError.makeFailure(e);
    }
  }

}