// import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/entities/review_entity.dart';

num getAvgRating(List<dynamic> reviews) {
  num sum = 0;
  for (var i = 0; i < reviews.length; i++) {
    sum += reviews[i].ratting;
  }
  if (reviews.isEmpty) {
    return 0;
  } else {
    return sum / reviews.length;
  }
}
