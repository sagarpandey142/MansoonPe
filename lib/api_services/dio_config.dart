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

  Dio getDio(){
    String username = 'lakshya';
    String password = 'lakshya@001';
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    Map<String, String> kHeaders = {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json; charset=utf-8',
      "Authorization": basicAuth
    };
    final options= BaseOptions(
        baseUrl: Apis.baseUrl,
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
        sendTimeout: const Duration(minutes: 2),
        receiveDataWhenStatusError: true,
        headers:kHeaders
    );
    var dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true
    ));
    return dio;
  }
}