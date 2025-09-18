// import 'package:fruits_app/features/auth/domain/entites/users_intites.dart';

abstract class DatabaseService {
  // Database service implementation
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  });
  Future<Map<String, dynamic>> getData(
      {required String path, required String docId});

  Future<bool> isDataExist({required String path, required String docId});
}
