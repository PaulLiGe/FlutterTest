import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test01/http/response_model.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(response.data.toString());
    // TODO: implement onResponse
    if (response.statusCode == 200) {
      try {
        ResponseBaseModel model = ResponseBaseModel.fromJson(response.data);
        if (model.errorCode == 0) {
          if (model.data == null) {
            handler.next(
                Response(requestOptions: response.requestOptions, data: true));
          } else {
            log("model.data是不是list${model.data}");
            handler.next(Response(
                requestOptions: response.requestOptions, data: model.data));
          }
        } else if (model.data == -1001) {
          handler.reject(DioException(
              requestOptions: response.requestOptions, message: "请登录"));
        } else {
          handler.reject(DioException(
              requestOptions: response.requestOptions, message: "出错了"));
        }
      } catch (e) {
        handler.reject(DioException(
            requestOptions: response.requestOptions, message: "出错了"));
      }
    } else {
      handler.reject(DioException(requestOptions: response.requestOptions));
    }
    // super.onResponse(response, handler);
  }
}
