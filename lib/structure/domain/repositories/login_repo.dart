
import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';
import '../../data/models/request/login_rq.dart';

abstract class LoginRepository{
  Future<BaseRp> login(LoginRq rq);
}