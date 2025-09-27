import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/entities/review_entity.dart';

class ReviewModle {
  final String name;
  final String image;
  final String date;
  final String reviewDesc;
  final String ratting;

  ReviewModle({
    required this.name,
    required this.image,
    required this.date,
    required this.reviewDesc,
    required this.ratting,
  });
  //from entites
  factory ReviewModle.fromEntites(ReviewEntity reviewEntity) => ReviewModle(
        name: reviewEntity.name,
        image: reviewEntity.image,
        date: reviewEntity.date,
        reviewDesc: reviewEntity.reviewDesc,
        ratting: reviewEntity.ratting,
      );
  //from json
  factory ReviewModle.fromJson(Map<String, dynamic> json) => ReviewModle(
        name: json["name"],
        image: json["image"],
        date: json["date"],
        reviewDesc: json["reviewDesc"],
        ratting: json["ratting"],
      );

//toJson
  toJson() => {
        "name": name,
        "image": image,
        "date": date,
        "reviewDesc": reviewDesc,
        "ratting": ratting,
      };
}
