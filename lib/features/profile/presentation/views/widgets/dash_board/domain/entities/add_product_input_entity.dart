import 'dart:io';

import 'package:equatable/equatable.dart';

// import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/entities/review_entity.dart';

class AddProductInputEntity extends Equatable {
  final String? productName;
  final String? productPrice;
  final String? productCode;
  final String? productDescription;
  final File productImageFile;
  final bool? productisFeatured;
  String? imageUrl;
  final String? expMonth;
  final bool? isOrganic;
  final String? calories;
  final String? unitMount;
  int avgRating = 0;
  int ratingCount = 0;
  final List<dynamic> reviews; //todo List<ReviewEntity>

  AddProductInputEntity({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDescription,
    required this.productImageFile,
    required this.productisFeatured,
    this.imageUrl,
    required this.expMonth,
    required this.isOrganic,
    required this.calories,
    required this.unitMount,
    required this.reviews,
  });

  @override
  List<Object?> get props => [productCode];
}
