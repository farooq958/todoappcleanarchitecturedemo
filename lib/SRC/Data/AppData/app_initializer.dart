

import 'package:todoappcleanarchitecturedemo/SRC/Data/AppData/data.dart';

import 'app_preferences.dart';

mixin AppInitializer {
   Future init() async {
  _user();

  Data().registerServices();

  }

  static Future _user() async {
    await SharedPrefs.init().whenComplete(() async {
     // await SharedPrefs.getUserLoginData();

     // SharedPrefs.getUserToken();

    });


  }
}
