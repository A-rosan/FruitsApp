import 'package:cloud_firestore/cloud_firestore.dart';

// import '../../features/auth/data/models/users_model.dart';
// import '../../features/auth/domain/entites/users_intites.dart';
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
  Future<dynamic> getData(
      {required String path,
      String? docId,
      Map<String, dynamic>? query}) async {
    if (docId != null) {
      var data = await firestore.collection(path).doc(docId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query["orderBy"] != null) {
          var orderByField = query["orderBy"];
          var decending = query["decending"];
          data = data.orderBy(orderByField, descending: decending);
        }
        if (query["limit"] != null) {
          var limit = query["limit"];
          data = data.limit(limit);
        }
      }
      var res = await data.get();
      return res.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> isDataExist(
      {required String path, required String docId}) async {
    DocumentSnapshot data = await firestore.collection(path).doc(docId).get();
    return data.exists;
  }
}
