import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rapexa_academy/structure/data/models/response/get_products_rp.dart';

import '../../../../infrastructure/constants/endpoints.dart';
import '../../../../infrastructure/network/base/base_rp.dart';
import '../../../../infrastructure/network/handle_error.dart';

class ProductDBRemote{

  final Dio _dio;

  ProductDBRemote(this._dio);

  Future<BaseRp> fetchProduct() async {
    try{
      var response = await _dio.get(EndPoints.LIST_PRODUCT);
      GetProductsRp productsRp = GetProductsRp.fromJson(response.data);
      for(Product product in productsRp.list!){
        product.teacherName = await fetchTeacher(product.permalink!);
      }
      return productsRp;
    } catch (e) {
      print(e.toString());
      return HandleHttpError.makeFailure(DioException(requestOptions: RequestOptions()));
    }
  }

  Future<String> fetchTeacher(String url) async{
    Dio dio = Dio();
    var response = await dio.get(url);
    return response.data.toString().split("img-fluid")[1].split("alt=\"")[1].split("\"")[0];
  }

}