import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:native_dio_adapter/native_dio_adapter.dart';

import '../on_linked_vars.dart';

class HttpConfig{

  static Future<Dio> build() async{
    final options = BaseOptions(
        connectTimeout: const Duration(milliseconds: 20000),
        receiveTimeout: const Duration(milliseconds: 20000),
        sendTimeout: const Duration(milliseconds: 20000),
        headers: {"Accept": "application/json"});
    Dio dio = Dio(options);
    if(Platform.isIOS || Platform.isAndroid){
      dio.httpClientAdapter = NativeAdapter();
    }
    dio.interceptors.add(LoggingInterceptor());
    return dio;
  }

}

class LoggingInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('\n');
    debugPrint(
        '--> ${options.method} ${'${options.baseUrl}${options.path}'}');
    debugPrint('Headers:');

    if(!options.uri.toString().contains("digits")){
        options.headers.addAll({
          "Authorization": token_wc
        });
      }else if(options.uri.toString().contains("digits") && options.uri.toString().contains("logout")){
        options.headers.addAll({
          "Authorization": user!.data!.accessToken!
        });
    }
    options.headers.forEach((k, dynamic v) => debugPrint('$k: $v'));
    debugPrint('queryParameters:');
    options.queryParameters.forEach((k, dynamic v) => debugPrint('$k: $v'));
    if (options.data != null) {
      debugPrint('Body: ${options.data}');
    }
    debugPrint(
        '--> END ${options.method}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('\n\n');
    debugPrint(
        '<--- HTTP CODE : ${response.statusCode} URL : ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    debugPrint('Headers: ');
    debugPrintWrapped('Response : ${response.data}');
    debugPrint('<--- END HTTP');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('\n');
    debugPrint(
        '<-- ${err.message} ${err.response?.requestOptions.method != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL'}');
    debugPrint(
        '${err.response != null ? err.requestOptions.data : 'Unknown Error'}');
    debugPrint('<-- End error');
    super.onError(err, handler);
  }

  void debugPrintWrapped(String text) {
    final RegExp pattern = RegExp('.{1,1000}');
    pattern
        .allMatches(text)
        .forEach((RegExpMatch match) => debugPrint(match.group(0)));
  }
}
