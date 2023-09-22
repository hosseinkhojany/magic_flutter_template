
import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';
import 'package:rapexa_academy/structure/data/models/request/forgot_password_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/login_with_otp_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/login_with_password_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/register_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/send_otp_rq.dart';
import 'package:rapexa_academy/structure/data/models/response/logins_and_forgot_and_register_rp.dart';
import 'package:rapexa_academy/structure/data/models/response/send_otp_rp.dart';

import '../../data/datasources/local/shared_store.dart';
import '../repositories/login_repo.dart';

class LoginUseCase{

  final LoginRepository _repository;
  LoginUseCase(this._repository);

  void loginWithPassword(
      LoginWithPasswordRq rq,
      {required Function() loading,
        required Function(Failure) error,
        required Function(LoginRp) success,
      }) async {
    loading.call();
    BaseRp rp = await _repository.loginWithPassword(rq);
    if(rp is Failure){
      error.call(rp);
    }else if(rp is LoginRp){
      success.call(rp);
    }else{
      //todo check if what happen if throwing failure
      throw Failure();
    }
  }

  void loginWithOtp(
      LoginWithOtpRq rq,
      {required Function() loading,
        required Function(Failure) error,
        required Function(LoginRp) success,
      }) async {
    loading.call();
    BaseRp rp = await _repository.loginWithOtp(rq);
    if(rp is Failure){
      error.call(rp);
    }else if(rp is LoginRp){
      success.call(rp);
    }else{
      //todo check if what happen if throwing failure
      throw Failure();
    }
  }

  void forgotPass(
      ForgotPasswordRq rq,
      {required Function() loading,
        required Function(Failure) error,
        required Function(LoginRp) success,
      }) async {
    loading.call();
    BaseRp rp = await _repository.forgotPassword(rq);
    if(rp is Failure){
      error.call(rp);
    }else if(rp is LoginRp){
      success.call(rp);
    }else{
      //todo check if what happen if throwing failure
      throw Failure();
    }
  }

  void sendOtp(
      SendOtpRq rq,
      {required Function() loading,
        required Function(Failure) error,
        required Function(SendOtpRp) success,
      }) async {
    loading.call();
    BaseRp rp = await _repository.sendOtp(rq);
    if(rp is Failure){
      error.call(rp);
    }else if(rp is SendOtpRp){
      success.call(rp);
    }else{
      //todo check if what happen if throwing failure
      throw Failure();
    }
  }

  void registerUser(
      RegisterRq rq,
      {required Function() loading,
        required Function(Failure) error,
        required Function(LoginRp) success,
      }) async {
    loading.call();
    BaseRp rp = await _repository.register(rq);
    if(rp is Failure){
      error.call(rp);
    }else if(rp is LoginRp){
      success.call(rp);
    }else{
      //todo check if what happen if throwing failure
      throw Failure();
    }
  }

  void logout(
      {required Function() loading,
        required Function(Failure) error,
        required Function(ZeroOneRp) success,
      }) async {
    loading.call();
    BaseRp rp = await _repository.logout();
    if(rp is Failure){
      error.call(rp);
    }else if(rp is ZeroOneRp){
      SharedStore.clearUserIdentity();
      success.call(rp);
    }else{
      //todo check if what happen if throwing failure
      throw Failure();
    }
  }

}