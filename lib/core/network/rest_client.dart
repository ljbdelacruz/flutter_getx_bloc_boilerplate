import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' as IO;

class RestClient {
  String userAgent = "Dart/8396d73bcd290";
  Dio dio;
  RestClient(){
    this.dio=Dio();
  }


  Dio getDioDebugging(){
    Dio ddio = new Dio();
    ddio.interceptors.add(
      PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          request: true,
          maxWidth: 128,
          error: true,
          responseBody: true),
    );
    return ddio;
  }


  Dio getDioIOCClientDebugging(){
    dio.interceptors.add(
      PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          request: true,
          maxWidth: 128,
          error: true,
          responseBody: true),
    );
    if(!kIsWeb){
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (IO.HttpClient client) {
          client.badCertificateCallback =
              (IO.X509Certificate cert, String host, int port) => true;
          return client;
        };
    }
    return dio; 
  }

  Dio getDioProduction(){
    Dio ddio = new Dio();
    return ddio;
  }

  Map<String, dynamic> loginHeader(){
    return {
      "Content-Type":"application/x-www-form-urlencoded",
      "Accept":"application/json",
      "User-Agent":userAgent,
    };
  }


  Map<String, dynamic> authHeader(String type, String token){
    return {
      "Content-Type":"application/x-www-form-urlencoded",
      "Authorization": type+" "+token,
      "User-Agent":userAgent,
    };
  }
  Map<String, dynamic> authHeaderUnspec(String type, String token){
    return {
      "Authorization": type+" "+token,
      "User-Agent":userAgent,
    };
  }




}