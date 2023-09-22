
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
    }else if(e.response != null){
      String? message;
      if(e.response!.data["message"] != null){
        message = e.response!.data["message"];
      }
      if(e.response!.data["msg"] != null){
        message = e.response!.data["msg"];
      }
      if(e.response!.data["data"]['msg'] != null){
        message = e.response!.data["data"]['msg'];
      }
      if(e.response!.data["data"]['message'] != null){
        message = e.response!.data["data"]['message'];
      }
      return Failure(networkConnectionError: false, httpStatusCode: e.response?.statusCode ?? 0, message: message);
    }else{
      //TODO: handle message params if you want
      return Failure(networkConnectionError: false, httpStatusCode: e.response?.statusCode ?? 0);
    }
  }
  static Failure makeFailureFromResponse(Response e){
    if(e.data != null){
      String? message;
      if(e.data!["message"] != null){
        message = e.data!["message"];
        return Failure(networkConnectionError: false, httpStatusCode: 0, message: message);
      }
      if(e.data!["msg"] != null){
        message = e.data!["msg"];
        return Failure(networkConnectionError: false, httpStatusCode: 0, message: message);
      }
      if(e.data!["data"]['message'] != null){
        message = e.data!["data"]['message'];
        return Failure(networkConnectionError: false, httpStatusCode: 0, message: message);
      }
      if(e.data!["data"]['msg'] != null){
        message = e.data!["data"]['msg'];
        return Failure(networkConnectionError: false, httpStatusCode: 0, message: message);
      }
      return Failure(networkConnectionError: false, httpStatusCode: 0, message: "");
    }else{
      //TODO: handle message params if you want
      return Failure(networkConnectionError: false, httpStatusCode: 0);
    }
  }

  static bool checkResponseIsFailed(Response e, {Function? onFailTrue}){
    if(e.data != null){
      if(e.data!["message"] != null){
        return true;
      }
      if(e.data!["msg"] != null){
        return true;
      }
      try{
        if(e.data!["data"]['msg'] != null){
          return true;
        }
      }catch(e){}
      try{
        if(e.data!["data"]['message'] != null){
          return true;
        }
      }catch(e){}
      return false;
    }else{
      return true;
    }
  }
}