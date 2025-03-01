import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test01/http/response_interceptor.dart';
import './http_method.dart';
import './print_interceptor.dart';
import './response_interceptor.dart';

class DioInstance {
  static DioInstance? _instance;

  DioInstance._();

  static DioInstance instance() {
    return _instance ??= DioInstance._();
  }

  final Dio _dio = Dio();
  final Duration _duration = Duration(seconds: 30);

  void initDio({
    String? httpMethod = HttpMethod.GET,
    String baseUrl = "https://www.wanandroid.com/",
    Duration? connectTime,
  }) {
    _dio.options = BaseOptions(
        method: httpMethod, baseUrl: baseUrl, connectTimeout: connectTime);
    _dio.interceptors.add(PrintInterceptor());
    _dio.interceptors.add(ResponseInterceptor());
  }

  Future<Response> get(
      {required String path,
      Map<String, dynamic>? params,
      Options? options}) async {
    return await _dio.get(path, queryParameters: params, options: options);
  }

  Future<Response> post(
      {required String path,
      Map<String, dynamic>? params,
      Options? options}) async {
    return await _dio.post(path,
        queryParameters: params,
        options: options ??
            Options(method: HttpMethod.POST, receiveTimeout: _duration));
  }
}
