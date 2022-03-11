import 'package:dio/dio.dart';
import '../error/failures.dart';

class NetworkUtil{

  Failure checkFailure(DioError e) {
    if(e.response.statusCode == 401){
      return UnauthorizedFailure();
    }else if(e.response.statusCode == 500){
      return ServerFailure();
    }else{
      return ServerFailure();
    }
  }
}