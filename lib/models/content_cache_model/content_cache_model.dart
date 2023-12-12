import 'package:hive/hive.dart';
part 'content_cache_model.g.dart';

@HiveType(typeId: 0)
class ContentCacheModel {
  @HiveField(0)
  List<String> moduleList;

  @HiveField(1)
  String name;

  @HiveField(2)
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
