import 'dart:convert';

import 'package:fruits_app/core/service/shared_pref_singlton.dart';
import 'package:fruits_app/features/auth/data/models/users_model.dart';
import 'package:fruits_app/features/auth/domain/entites/users_intites.dart';

// import '../utils/app_constant.dart';

UsersEntites getUserData() {
  //get user data from shared pref
  String? jsonString = Prefs.getString("userData");
  var userEntity = UserModel.fromJson(jsonDecode(jsonString!));
  if (jsonString.isEmpty) {
    return UserModel(
      name: "",
      email: "",
      uId: "",
    );
  }
  return userEntity;
}
