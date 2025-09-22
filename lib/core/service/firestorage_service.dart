import 'package:firebase_storage/firebase_storage.dart';

import 'storage_service.dart';

class FirestorageService implements StorageService {
  final storageRef = FirebaseStorage.instance;
  @override
  Future<String> uploadFile(String file) {
    throw UnimplementedError();
  }
}
