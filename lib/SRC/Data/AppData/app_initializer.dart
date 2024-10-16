

import 'package:todoappcleanarchitecturedemo/SRC/Data/AppData/data.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/di/service_locator.dart';

import 'app_preferences.dart';

mixin AppInitializer {
   Future init() async {
  _user();
  setupLocator();

 // Data().registerServices();

  }

  static Future _user() async {
    await SharedPrefs.init().whenComplete(() async {
     // await SharedPrefs.getUserLoginData();

     // SharedPrefs.getUserToken();

    });


  }
}
