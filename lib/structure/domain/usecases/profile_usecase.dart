

import 'package:rapexa_academy/structure/data/models/request/get_profile_rq.dart';
import 'package:rapexa_academy/structure/data/models/response/get_profile_rp.dart';
import 'package:rapexa_academy/structure/domain/repositories/profile_repo.dart';

import '../../../infrastructure/network/base/base_rp.dart';

class ProfileUseCase{

  final ProfileRepository _repository;
  ProfileUseCase(this._repository);



  void getProfile(
      ProfileRq rq,
      {required Function() loading,
        required Function(Failure) error,
        required Function(GetProfileRp) success,
      }) async {
    loading.call();
    BaseRp rp = await _repository.getProfile(rq);
    if(rp is Failure){
      error.call(rp);
    }else if(rp is GetProfileRp){
      success.call(rp);
    }else{
      //todo check if what happen if throwing failure
      throw Failure();
    }
  }

}