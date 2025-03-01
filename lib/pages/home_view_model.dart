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

  Future getHomeList() async {
    Response response =
        await DioInstance.instance().get(path: 'article/list/1/json');
    String standardJson = json.encode(response.data);
    print(standardJson);

    HomeListData listData = HomeListData.fromJson(response.data);
    if (listData.data != null && listData.data?.datas != null) {
      listDatas = listData.data?.datas;
    } else {
      listDatas = [];
    }
    notifyListeners();
  }
}
