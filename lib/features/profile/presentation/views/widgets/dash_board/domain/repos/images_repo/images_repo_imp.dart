import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:fruits_app/core/errors/failuers.dart';
import 'package:fruits_app/core/service/storage_service.dart';
import 'package:fruits_app/core/utils/end_points.dart';

import 'images_repo.dart';

class ImagesRepoImp implements ImagesRepo {
  final StorageService storageService;
  ImagesRepoImp({required this.storageService});
  @override
  Future<Either<Failuer, String>> uploadImage(File image) async {
    try {
      String imageUrl =
          await storageService.uploadFile(image, EndPoints.images);
      return right(imageUrl);
    } on Exception catch (e) {
      return left(ServerFailuer("حدث خطا في تحميل الصورة"));
    }
  }
}
