
import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';
import 'package:rapexa_academy/structure/data/datasources/remote/profile_db_remote.dart';
import 'package:rapexa_academy/structure/domain/repositories/profile_repo.dart';

class ProfileRepositoryImpl implements ProfileRepository {

  ProfileDBRemote remoteDb;

  ProfileRepositoryImpl(this.remoteDb);

  @override
  Future<BaseRp> getProfile(rq) {
    return remoteDb.fetchProfile();
  }

  @override
  Future<String> getTeacher() {
    // TODO: implement getTeacher
    throw UnimplementedError();
  }

}