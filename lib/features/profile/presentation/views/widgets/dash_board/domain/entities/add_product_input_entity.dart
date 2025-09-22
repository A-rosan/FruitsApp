import 'dart:io';

class AddProductInputEntity {
  final String? productName;
  final String? productPrice;
  final String? productCode;
  final String? productDescription;
  final File productImage;
  final bool? productisFeatured;
  final String? imageUrl;

  AddProductInputEntity({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDescription,
    required this.productImage,
    required this.productisFeatured,
    this.imageUrl,
  });
}
