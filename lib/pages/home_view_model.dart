import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test01/http/dio_instance.dart';
import 'dart:convert';
import 'package:test01/pages/home_model.dart';
import 'home_list_data.dart';
import '../models/api.dart';

class HomeViewModel with ChangeNotifier {
  List<BannerItemData>? bannerList;
  List<Datas>? listDatas;
  int page = 1;
  Future getBanner() async {
    bannerList = await Api.instance().getBanner();
    notifyListeners();
  }

  Future getListData(bool loadMore) async {
    if (loadMore) {
      page++;
    } else {
      page = 1;
      listDatas?.clear();
    }
    await getTopList(loadMore);
    await getHomeList(loadMore);
  }

  Future getHomeList(bool loadMore) async {
    List<Datas>? data = await Api.instance().getHomeList(page);
    listDatas = listDatas ?? [];
    listDatas?.addAll(data ?? []);
    notifyListeners();
  }

  Future getTopList(bool loadMore) async {
    if (loadMore) return;

    List<Datas>? data = await Api.instance().getTopList();
    listDatas?.clear();
    listDatas?.addAll(data ?? []);
  }
}
