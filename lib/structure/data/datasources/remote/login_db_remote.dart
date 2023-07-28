import 'package:dio/dio.dart';
import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';
import 'package:rapexa_academy/infrastructure/network/handle_error.dart';

import '../../../../infrastructure/constants/endpoints.dart';
import '../../models/request/login_rq.dart';
import '../../models/response/login_rp.dart';

class LoginDataSourceRemote{

  final Dio _dio;
  LoginDataSourceRemote(this._dio);

  Future<BaseRp> login(LoginRq rq) async {
    try{
      var response = await _dio.post(EndPoints.LOGIN, data: rq.toJson());
      return LoginRp.fromJson(response.data);
    }  on DioException catch (e) {
      return HandleHttpError.makeFailure(e);
    }
  }

}