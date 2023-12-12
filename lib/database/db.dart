import 'package:hive/hive.dart';
import 'package:inaxus_machine_test/models/content_cache_model/content_cache_model.dart';

class Db {
  static late Box<ContentCacheModel> _box;

  static void init() async {
    _box = await Hive.openBox<ContentCacheModel>("userData");
  }

  static Future<void> storeContentCache(
      ContentCacheModel contentCacheModel) async {
    await _box.put("contentCache", contentCacheModel);
  }

  static Future<ContentCacheModel?> retrieveContentCache() async {
    final retrievedList = _box.get('contentCache');
    return retrievedList;
  }
}
