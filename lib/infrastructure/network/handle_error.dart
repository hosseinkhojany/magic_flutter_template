
import 'package:dio/dio.dart';
import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_snackbar.dart';

class HandleHttpError{
  static Failure makeFailure(DioException e){
    if(
        e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout
    ){
      AppSnackBar.showError("Network error");
      return Failure(networkConnectionError: true);
    }else{
      //TODO: handle message params if you want
      return Failure(networkConnectionError: false, httpStatusCode: e.response?.statusCode ?? 0);
    }
  }
}