import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../../../../../core/errors/failuers.dart';

abstract class ImagesRepo {
  Future<Either<Failuer, String>> uploadImage(File image);
}
