import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inaxus_machine_test/core/constants.dart';
import 'package:inaxus_machine_test/models/api_result.dart';
import 'package:inaxus_machine_test/models/content_cache_model.dart';

class ApiContentCache {
//first data, second error message
  static Future<ApiResult<ContentCacheModel?>> getContentCache(
      {required String email, required String password}) async {
    String url =
        "${Constants.baseUrl}Common/ContentCache?Email=$email&Password=$password&DatabaseName=InaxusV5&ProjectID=2";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        ContentCacheModel contentCacheModel = ContentCacheModel.fromJson(json);
        return ApiResult(contentCacheModel);
      } else {
        throw Exception(
            'Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      return ApiResult(null, message: e.toString());
    }
  }
}
