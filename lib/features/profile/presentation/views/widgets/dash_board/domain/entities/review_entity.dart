import 'package:fruits_app/generated/l10n.dart';

class ReviewEntity {
  final String name;
  final String image;
  final String date;
  final String reviewDesc;
  final String ratting;

  ReviewEntity({
    required this.name,
    required this.image,
    required this.date,
    required this.reviewDesc,
    required this.ratting,
  });
}
