class ContentCacheModel {
  List<String> moduleList;
  String name;
  String email;
  ContentCacheModel({
    required this.moduleList,
    required this.name,
    required this.email,
  });

  factory ContentCacheModel.fromJson(Map<String, dynamic> json) {
    List<String> moduleList = (json["ModuleList"] as List)
        .cast<Map<String, dynamic>>()
        .map((e) => e["ModuleName"])
        .toList()
        .cast<String>();
    return ContentCacheModel(
        moduleList: moduleList,
        name: json["UserFirstName"],
        email: json["EmailAddress"]);
  }
}
