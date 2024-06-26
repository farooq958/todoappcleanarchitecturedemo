import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Domain/Model/user_model.dart';

import 'data.dart';

class SharedPrefs {
  // SharedPrefs._();

  /// reference of Shared Preferences
  static SharedPreferences? _preferences;

  /// Initialization of Shared Preferences
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  ///survey

  ///UserData stored in json
  ///userRawData will be in map<String,dynamic>
  static Future setUserLoginData({required  userRawData}) async =>
      await _preferences?.setString("user", jsonEncode(userRawData));

  static Future setLoginToken(String token) async =>
      await _preferences!.setString('token', token);

  //

  static String? getUserToken() {
    String? token;
    token = _preferences!.getString("token");

    if (token != null) {
      Data.app.token = token;
    }
    return token;
  }

  //
  static Future<UserModel>? getUserLoginData() {
    String? userJson;
    if (_preferences!.containsKey('user')) {
      userJson = _preferences!.getString("user");

      print(userJson.toString());

      if (userJson != null) {
        Data.app.user = UserModel.fromRawJson(userJson);

        print("Data.app.user");
        print(Data.app.user?.email);
      }
    }
    return Future.value(Data.app.user);
  }

  static Future clearUserData() async {

   bool?stat= await _preferences!.clear();
   Data.app.token=null;
   Data.app.user=null;
   print(stat);
   return stat;
  }
}
