import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/auth/data/models/users_model.dart';
import '../../features/auth/domain/entites/users_intites.dart';
import 'database_service.dart';

class FireStoreService implements DatabaseService {
  // Firestore service implementation
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId}) async {
    if (docId != null) {
      firestore.collection(path).doc(docId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String docId}) async {
    DocumentSnapshot data = await firestore.collection(path).doc(docId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> isDataExist(
      {required String path, required String docId}) async {
    DocumentSnapshot data = await firestore.collection(path).doc(docId).get();
    return data.exists;
  }
}
