import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test01/http/dio_instance.dart';
import 'dart:convert';
import 'package:test01/pages/home_model.dart';
import 'home_list_data.dart';

class HomeViewModel with ChangeNotifier {
  List<BannerItemData>? bannerList;
  List<Datas>? listDatas;

  Future getBanner() async {
    Response response = await DioInstance.instance().get(path: "banner/json");
    dynamic responseData = response.data;
    print('运行时类型${responseData.runtimeType} $responseData');
    if (responseData is List) {
      bannerList =
          responseData.map((item) => BannerItemData.fromJson(item)).toList();
    } else {
      bannerList = [];
    }
    notifyListeners();
  }

  Future getHomeList() async {
    Response response =
        await DioInstance.instance().get(path: 'article/list/1/json');
    dynamic responseData = response.data;
    Data data = Data.fromJson(responseData);
    listDatas = data.datas;
    notifyListeners();
  }
}
