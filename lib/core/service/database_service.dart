// import 'package:fruits_app/features/auth/domain/entites/users_intites.dart';

abstract class DatabaseService {
  // Database service implementation
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  });
  Future<dynamic> getData({
    required String path,
    String? docId,
    Map<String, dynamic>? query,
  });

  Future<bool> isDataExist({required String path, required String docId});
}
