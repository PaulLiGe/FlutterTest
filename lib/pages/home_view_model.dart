import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:test01/pages/home_model.dart';

class HomeViewModel with ChangeNotifier {
  List<BannerItemData>? bannerList;

  Future getBanner() async {
    Dio dio = Dio();
    dio.options = BaseOptions(
        method: "Get",
        baseUrl: "https://www.wanandroid.com/",
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        sendTimeout: Duration(seconds: 30));

    Response response = await dio.get("banner/json");
    String standardJson = json.encode(response.data);
    print('沃日');
    print(standardJson);
    HomeBannerModel model = HomeBannerModel.fromJson(response.data);
    if (model.data != null) {
      bannerList = model.data;
    } else {
      bannerList = [];
    }
    notifyListeners();
  }
}
