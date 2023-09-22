
import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';
import 'package:rapexa_academy/structure/data/models/request/forgot_password_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/login_with_otp_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/login_with_password_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/register_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/send_otp_rq.dart';

abstract class LoginRepository{
  Future<BaseRp> sendOtp(SendOtpRq rq);
  Future<BaseRp> reSendOtp(SendOtpRq rq);
  Future<BaseRp> loginWithOtp(LoginWithOtpRq rq);
  Future<BaseRp> loginWithPassword(LoginWithPasswordRq rq);
  Future<BaseRp> register(RegisterRq rq);
  Future<BaseRp> forgotPassword(ForgotPasswordRq rq);
  Future<BaseRp> logout();
}