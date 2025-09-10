import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failuers.dart';
import 'package:fruits_app/features/auth/domain/entites/users_intites.dart';
import 'package:fruits_app/features/auth/domain/repos/repos.dart';

class AuthRepoImp extends AuthRepo {
  @override
  Future<Either<Failuer, UsersIntites>> createUsersWithEmailAndPassword(
      String email, String password) {
    // TODO: implement createUsersWithEmailAndPassword
    throw UnimplementedError();
  }
}
