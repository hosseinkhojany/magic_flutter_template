

import 'package:dio/dio.dart';
import 'package:rapexa_academy/structure/data/models/response/get_profile_rp.dart';

import '../../../../infrastructure/constants/endpoints.dart';
import '../../../../infrastructure/network/base/base_rp.dart';
import '../../../../infrastructure/network/handle_error.dart';


class ProfileDBRemote {

  final Dio _dio;

  ProfileDBRemote(this._dio);


  Future<BaseRp> fetchProfile() async {
    try{
      var response = await _dio.get(EndPoints.LIST_PRODUCT);
      return HandleHttpError.makeFailure(DioException(requestOptions: RequestOptions()));
    } catch (e) {
      return HandleHttpError.makeFailure(DioException(requestOptions: RequestOptions()));
    }
  }

}