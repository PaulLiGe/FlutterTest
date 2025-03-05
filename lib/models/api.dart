import 'package:test01/pages/home_list_data.dart';
import 'package:test01/pages/home_model.dart';

import '../http/dio_instance.dart';
import 'package:dio/dio.dart';

class Api {
  static Api? _instance;

  Api._();
  static Api instance() {
    return _instance ??= Api._();
  }

  // 获取banner数据
  Future<List<BannerItemData>?> getBanner() async {
    Response response = await DioInstance.instance().get(path: "banner/json");
    // HomeBannerModel bannerData = HomeBannerModel.fromJson(response.data);
    List<Map<String, dynamic>> mapList =
        (response.data as List).cast<Map<String, dynamic>>();
    List<BannerItemData>? data =
        mapList.map((e) => BannerItemData.fromJson(e)).toList();
    return data;
  }

  // 获取list数据
  Future<List<Datas>?> getHomeList(int page) async {
    Response response =
        await DioInstance.instance().get(path: 'article/list/$page/json');
    print("邮寄过了${response.data}");
    Data data = Data.fromJson(response.data);

    return data.datas;
  }

  Future<List<Datas>?> getTopList() async {
    Response response =
        await DioInstance.instance().get(path: 'article/top/json');
    List<Datas> datas = [];
    if (response.data is List) {
      datas = (response.data as List).map((e) => Datas.fromJson(e)).toList();
    }
    return datas;
  }
}
