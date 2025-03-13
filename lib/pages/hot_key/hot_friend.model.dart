
class HotFriendModel {
  String? category;
  String? icon;
  int? id;
  String? link;
  String? name;
  int? order;
  int? visible;

  HotFriendModel({this.category, this.icon, this.id, this.link, this.name, this.order, this.visible});

  HotFriendModel.fromJson(Map<String, dynamic> json) {
    if(json["category"] is String) {
      category = json["category"];
    }
    if(json["icon"] is String) {
      icon = json["icon"];
    }
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["link"] is String) {
      link = json["link"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["order"] is int) {
      order = json["order"];
    }
    if(json["visible"] is int) {
      visible = json["visible"];
    }
  }

  static List<HotFriendModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(HotFriendModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["category"] = category;
    _data["icon"] = icon;
    _data["id"] = id;
    _data["link"] = link;
    _data["name"] = name;
    _data["order"] = order;
    _data["visible"] = visible;
    return _data;
  }
}