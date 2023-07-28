import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';

import '../../domain/repositories/login_repo.dart';
import '../datasources/remote/login_db_remote.dart';
import '../models/request/login_rq.dart';

class LoginRepositoryImpl implements LoginRepository{

  LoginDataSourceRemote remoteDb;
  LoginRepositoryImpl(this.remoteDb);

  @override
  Future<BaseRp> login(LoginRq rq) {
    return remoteDb.login(rq);
  }


}