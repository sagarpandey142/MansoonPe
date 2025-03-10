import 'dart:convert';
import 'package:dio/dio.dart';
import 'apis.dart';

class DioConfig{
  static DioConfig? _instance;

  factory DioConfig.getInstance(){
    _instance ??= DioConfig._();
    return _instance!;
  }
  DioConfig._();

  Dio getDio({String token = ''}){
    String username = 'lakshya';
    String password = 'lakshya@001';
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    String bearerToken = 'Bearer $token';
    Map<String, String> kHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization": token.isEmpty ? basicAuth : bearerToken
    };
    final options= BaseOptions(
      baseUrl: Apis.baseUrl,
      connectTimeout: const Duration(minutes: 2),
      receiveTimeout: const Duration(minutes: 2),
      sendTimeout: const Duration(minutes: 2),
      receiveDataWhenStatusError: true,
      headers:kHeaders,
      responseType: ResponseType.plain,
    );
    var dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true
    ));
    return dio;
  }


  Dio getMultipartDio({String token = ''}){
    String username = 'lakshya';
    String password = 'lakshya@001';
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    String bearerToken = 'Bearer $token';
    Map<String, String> kHeaders = {
      "Content-Type": "multipart/form-data",
      "Authorization": token.isEmpty ? basicAuth : bearerToken
    };
    final options= BaseOptions(
      baseUrl: Apis.baseUrl,
      connectTimeout: const Duration(minutes: 2),
      receiveTimeout: const Duration(minutes: 2),
      sendTimeout: const Duration(minutes: 2),
      receiveDataWhenStatusError: true,
      headers:kHeaders,
      responseType: ResponseType.plain,
    );
    var dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true
    ));
    return dio;
  }
}