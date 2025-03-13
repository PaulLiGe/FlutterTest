import 'package:flutter/material.dart';
import 'package:test01/models/api.dart';

import './hot_friend.model.dart';
import './hot_key_model.dart';

class HotKeyVM with ChangeNotifier {
  List<HotFriendModel>? friends;
  List<HotKeyModel>? keys;

  Future getHotListData() async {
    keys = await Api.instance().getHotKeyList();
    friends = await Api.instance().getFriendsList();

    notifyListeners();
  }
}
