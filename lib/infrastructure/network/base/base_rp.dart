class BaseRp{}
class Failure extends BaseRp{
  bool? networkConnectionError;
  int? httpStatusCode;
  String? message;
  Failure({this.networkConnectionError, this.httpStatusCode, this.message});
}
