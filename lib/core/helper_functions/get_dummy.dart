import 'dart:io';

import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/entities/add_product_input_entity.dart';

AddProductInputEntity getDummyProducts() {
  return AddProductInputEntity(
    productName: "apple",
    productPrice: "10",
    productCode: "123",
    productDescription: "apple",
    productImageFile: File(""),
    productisFeatured: true,
    imageUrl: null,
    expMonth: "10",
    isOrganic: true,
    calories: '10',
    unitMount: '10',
    reviews: [],
  );
}

List<AddProductInputEntity> getDummy() {
  return [
    getDummyProducts(),
    getDummyProducts(),
    getDummyProducts(),
    getDummyProducts(),
    getDummyProducts(),
  ];
}
