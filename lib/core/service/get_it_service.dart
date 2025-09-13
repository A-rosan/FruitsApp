import 'package:fruits_app/core/service/firebase_auth_service.dart';
import 'package:fruits_app/features/auth/domain/repos/repos.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_imp.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
      AuthRepoImp(firebaseAuthService: getIt<FirebaseAuthService>()));
}
