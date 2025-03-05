class ResponseBaseModel<T> {
  T? data;
  int? errorCode;
  String? errorMsg;

  ResponseBaseModel.fromJson(dynamic json) {
    if (T == List<Map<String, dynamic>>) {
      data = (json["data"] as List).cast<Map<String, dynamic>>() as T;
    } else {
      data = json["data"];
    }
    errorCode = json["errorCode"];
    errorMsg = json["errorMsg"];
  }
}
