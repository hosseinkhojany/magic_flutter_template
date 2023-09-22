


import 'package:rapexa_academy/structure/data/models/request/get_profile_rq.dart';

import '../../../infrastructure/network/base/base_rp.dart';

abstract class ProfileRepository {
  Future<BaseRp> getProfile(ProfileRq rq);
  Future<String> getTeacher();
}