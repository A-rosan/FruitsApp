import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failuers.dart';
import 'package:fruits_app/features/auth/domain/entites/users_intites.dart';

abstract class AuthRepo {
  Future<Either<Failuer, UsersIntites>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );

  Future<Either<Failuer, UsersIntites>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failuer, UsersIntites>> signInWithGoogle();
}
