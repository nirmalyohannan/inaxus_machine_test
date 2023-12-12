import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inaxus_machine_test/core/constants.dart';
import 'package:inaxus_machine_test/models/api_result.dart';

class ApiLogin {
  //returns true,false based on the login attempt, and the error message if has any
  static Future<ApiResult<bool?>> login(
      {required String email, required String password}) async {
    String url =
        "${Constants.baseUrl}Account/Login?Email=$email&Password=$password";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        if (json["Message"] == "success") {
          return ApiResult(true);
        } else {
          var result = ApiResult(null, message: json["Message"]);
          return result;
        }
      } else {
        return ApiResult(null, message: response.reasonPhrase);
      }
    } catch (e) {
      return ApiResult(null, message: e.toString());
    }
  }
}
