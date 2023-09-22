import 'package:dio/dio.dart';
import 'package:rapexa_academy/structure/data/models/response/get_posts_rp.dart';
import 'package:rapexa_academy/structure/data/models/response/get_products_rp.dart';

import '../../../../infrastructure/constants/endpoints.dart';
import '../../../../infrastructure/network/base/base_rp.dart';
import '../../../../infrastructure/network/handle_error.dart';

class PostDBRemote{

  final Dio _dio;

  PostDBRemote(this._dio);

  Future<BaseRp> fetchPosts() async {
    try{
      var response = await _dio.get(EndPoints.LIST_POSTS);
      return GetPostsRp.fromJson(response.data);
    } catch (e) {
      return HandleHttpError.makeFailure(DioException(requestOptions: RequestOptions()));
    }
  }

}