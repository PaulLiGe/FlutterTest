class HotKeyModel {
  int? id;
  String? link;
  String? name;
  int? order;
  int? visible;

  HotKeyModel({this.id, this.link, this.name, this.order, this.visible});

  HotKeyModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["link"] is String) {
      link = json["link"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }

    if (json["order"] is int) {
      order = json["order"];
    }
    if (json["visible"] is int) {
      visible = json["visible"];
    }
  }

  static List<HotKeyModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(HotKeyModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["link"] = link;
    _data["name"] = name;
    _data["order"] = order;
    _data["visible"] = visible;
    return _data;
  }
}
