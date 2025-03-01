import 'dart:developer';

import 'package:dio/dio.dart';

class PrintInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("\n请求开始==============================");
    options.headers.forEach((key, value) {
      log("请求头的key=$key, 请求头value=$value");
    });
    log("path:${options.uri}");
    log("请求参数:${options.queryParameters.toString()}");
    super.onRequest(options, handler);
  }
}
