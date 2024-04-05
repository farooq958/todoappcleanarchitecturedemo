

import 'package:todoappcleanarchitecturedemo/SRC/Domain/Model/user_model.dart';

mixin UserData {
  static String? userToken;

  static UserModel? userData;

  set token(String? token) => userToken = token;

  set user(UserModel? userModel) => userData = userModel;

  UserModel? get user => userData;

  String? get token => userToken;
}
