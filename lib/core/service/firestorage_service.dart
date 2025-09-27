import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b;

import 'storage_service.dart';

class FirestorageService implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extension = b.extension(file.path);
    var fileRef = storageRef.child("$path/$fileName.$extension");
    await fileRef.putFile(file);
    var fileUrl = fileRef.getDownloadURL();
    return fileUrl;
  }
}
