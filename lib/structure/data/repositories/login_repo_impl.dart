import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';
import 'package:rapexa_academy/structure/data/datasources/local/shared_store.dart';
import 'package:rapexa_academy/structure/data/models/request/forgot_password_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/login_with_otp_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/login_with_password_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/register_rq.dart';
import 'package:rapexa_academy/structure/data/models/request/send_otp_rq.dart';
import 'package:rapexa_academy/structure/data/models/response/logins_and_forgot_and_register_rp.dart';

import '../../domain/repositories/login_repo.dart';
import '../datasources/remote/login_db_remote.dart';

class LoginRepositoryImpl implements LoginRepository{

  LoginDataSourceRemote remoteDb;
  LoginRepositoryImpl(this.remoteDb);

  @override
  Future<BaseRp> register(RegisterRq rq)async {
    BaseRp rp = await remoteDb.register(rq);
    if(rp is LoginRp){
      SharedStore.setUser(rp);
    }
    return rp;
  }

  @override
  Future<BaseRp> forgotPassword(ForgotPasswordRq rq) async{
    BaseRp rp = await remoteDb.forgotPasswordOtp(rq);
    if(rp is LoginRp){
      SharedStore.setUser(rp);
    }
    return rp;
  }

  @override
  Future<BaseRp> loginWithOtp(LoginWithOtpRq rq) async {
    BaseRp rp = await remoteDb.loginWithOtp(rq);
    if(rp is LoginRp){
      SharedStore.setUser(rp);
    }
    return rp;
  }

  @override
  Future<BaseRp> loginWithPassword(LoginWithPasswordRq rq) async {
    BaseRp rp = await remoteDb.loginWithPassword(rq);
    if(rp is LoginRp){
      SharedStore.setUser(rp);
    }
    return rp;
  }

  @override
  Future<BaseRp> sendOtp(SendOtpRq rq) {
    return remoteDb.sendOtp(rq);
  }

  @override
  Future<BaseRp> logout() {
    return remoteDb.logout();
  }

  @override
  Future<BaseRp> reSendOtp(SendOtpRq rq) {
    return remoteDb.sendOtp(rq);
  }



}