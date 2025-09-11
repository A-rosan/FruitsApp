import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/features/auth/domain/entites/users_intites.dart';

class UserModel extends UsersIntites {
  UserModel({
    required super.name,
    required super.email,
    required super.uId,
  });
  factory UserModel.fromFirbaseUser(User user) {
    return UserModel(
      name: user.displayName ?? "",
      email: user.email ?? "",
      uId: user.uid,
    );
  }
}
