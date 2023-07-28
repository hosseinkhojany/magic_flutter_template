


import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';
import 'package:rapexa_academy/structure/data/models/response/login_rp.dart';

import '../../data/models/request/login_rq.dart';
import '../repositories/login_repo.dart';

class LoginUseCase{

  final LoginRepository _repository;
  LoginUseCase(this._repository);

  void login(
      LoginRq rq,
      {required Function() loading,
        required Function(Failure) error,
        required Function(LoginRp) success,
      }) async {
    loading.call();
    BaseRp rp = await _repository.login(rq);
    if(rp is Failure){
      error.call(rp);
    }else if(rp is LoginRp){
      success.call(rp);
    }else{
      //todo check if what happen if throwing failure
      throw Failure();
    }
  }

}