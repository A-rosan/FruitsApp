import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:fruits_app/core/errors/failuers.dart';

import 'images_repo.dart';

class ImagesRepoImp implements ImagesRepo {
  @override
  Future<Either<Failuer, String>> uploadImage(File image) {
    throw UnimplementedError();
  }
}
