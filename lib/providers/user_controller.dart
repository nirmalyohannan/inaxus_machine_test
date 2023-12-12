import 'package:flutter/material.dart';
import 'package:inaxus_machine_test/database/db.dart';
import 'package:inaxus_machine_test/models/api_result.dart';
import 'package:inaxus_machine_test/resource/content_cache.dart';
import 'package:inaxus_machine_test/resource/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class UserController extends ChangeNotifier {
  UserController._internal();

  static final UserController instance = UserController._internal();

  String? name;
  String? email;
  String? password;
  List<String> moduleList = [];

  bool isGettingModuleList = true;

// returns the error message to UI if has any
  void getContentCache() async {
    // Obtain shared preferences.
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    var contentCache = await Db.retrieveContentCache();
    if (contentCache != null) {
      moduleList = contentCache.moduleList;
      name = contentCache.name;
      email = contentCache.email;
    } else {
      isGettingModuleList = true;
      notifyListeners();
      var result = await ApiContentCache.getContentCache(
          email: email!, password: password!);
      if (result.dataIsNotNull) {
        name = result.data!.name;
        email = result.data!.email;
        moduleList = result.data!.moduleList;

        Db.storeContentCache(result.data!);
      }
    }

    isGettingModuleList = false;
    notifyListeners();
  }

  // returns the error message to UI if has any
  Future<ApiResult<bool?>> login(
      {required String email, required String password}) async {
    var result = await ApiLogin.login(email: email, password: password);
    if (result.dataIsNotNull && result.data! == true) {
      this.email = email;
      this.password = password;
    }
    return result;
  }
}
