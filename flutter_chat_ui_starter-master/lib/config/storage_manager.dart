import 'dart:io';


import 'package:flutter_todos/models/request.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class StorageManager {
  /// app global configuration eg:theme
  static SharedPreferences sharedPreferences;

  /// Temporary directory eg: cookie
  static Directory temporaryDirectory;


  /// Initialize necessary operations eg: user data
  static LocalStorage localStorage;

  /// Initialization of necessary data
  ///
  /// So the synchronization operation will cause blocking, so the storage capacity should be reduced as much as possible
  static init() async {
    // async 
    // sync 
    temporaryDirectory = await getTemporaryDirectory();
    sharedPreferences = await SharedPreferences.getInstance();
    localStorage = LocalStorage('LocalStorage');
    await localStorage.ready;
  }

  static Future<void> setToken(String token) async {
    localStorage.setItem("token", token);
  }

  static Future<void> setUser(dynamic user) async {
    localStorage.setItem("user", user);
  }

  static Future<void> setNavInfo(dynamic navInfo) async {
    print("navinfo save $navInfo");
//    localStorage.deleteItem("navInfo");
    localStorage.setItem("navInfo", navInfo);
  }


  static Future<String> getToken() async {
    String token = localStorage.getItem("token");
    print(token);
    return token;
  }

  static deleteToken() async {
    return localStorage.deleteItem("token");
  }
  static deleteTokenAndUser() async {
      localStorage.deleteItem("user");
      localStorage.deleteItem("token");
      return;
  }

  static Future<User> getUser() async {
    var obj = localStorage.getItem("user");
    return obj != null ? User.fromJson(obj) : null;
  }

}
