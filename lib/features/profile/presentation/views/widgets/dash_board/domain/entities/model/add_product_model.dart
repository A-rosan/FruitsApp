import 'dart:io';

import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/entities/add_product_input_entity.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/entities/model/review_modle.dart';

import '../review_entity.dart';

class AddProductModel {
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
  final List<ReviewModle> reviews;

  AddProductModel({
    this.productName,
    this.productPrice,
    this.productCode,
    this.productDescription,
    required this.productImageFile,
    this.productisFeatured,
    this.imageUrl,
    required this.expMonth,
    required this.isOrganic,
    required this.calories,
    required this.unitMount,
    required this.reviews,
  });

  factory AddProductModel.fromEntity(
      AddProductInputEntity addProductInputEntity) {
    return AddProductModel(
      productName: addProductInputEntity.productName,
      productPrice: addProductInputEntity.productPrice,
      productCode: addProductInputEntity.productCode,
      productDescription: addProductInputEntity.productDescription,
      productImageFile: addProductInputEntity.productImageFile,
      productisFeatured: addProductInputEntity.productisFeatured,
      imageUrl: addProductInputEntity.imageUrl,
      expMonth: addProductInputEntity.expMonth,
      isOrganic: addProductInputEntity.isOrganic,
      calories: addProductInputEntity.calories,
      unitMount: addProductInputEntity.unitMount,
      reviews: addProductInputEntity.reviews
          .map((e) => ReviewModle.fromEntites(e))
          .toList(),
    );
  }

  toJson() => {
        "productName": productName,
        "productPrice": productPrice,
        "productCode": productCode,
        "productDescription": productDescription,
        // "productImage": productImageFile,
        "productisFeatured": productisFeatured,
        "imageUrl": imageUrl,
        "expMonth": expMonth,
        "isOrganic": isOrganic,
        "calories": calories,
        "unitMount": unitMount,
        "reviews": reviews.map((e) => e.toJson()).toList(),
      };
}
