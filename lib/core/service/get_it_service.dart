import 'dart:ui';

import 'package:fruits_app/core/service/database_service.dart';
import 'package:fruits_app/core/service/firebase_auth_service.dart';
import 'package:fruits_app/core/service/firestore_service.dart';
import 'package:fruits_app/features/auth/domain/repos/repos.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/repos/images_repo/images_repo_imp.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/repos/products_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_imp.dart';
import '../../features/profile/presentation/views/widgets/dash_board/domain/repos/images_repo/images_repo.dart';
import '../../features/profile/presentation/views/widgets/dash_board/domain/repos/products_repo_imp.dart';
import 'firestorage_service.dart';
import 'storage_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<StorageService>(FirestorageService());
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImp(
    databaseService: getIt<DatabaseService>(),
  ));
  getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImp(storageService: getIt<StorageService>()));
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
}
