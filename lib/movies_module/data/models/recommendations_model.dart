import 'package:egybest/movies_module/domain/entity/recommendation.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({
     super.recommendationBackdropPath,
    required super.id,
  });

  factory RecommendationsModel.fromjson(Map<String, dynamic> json) =>
      RecommendationsModel(
        recommendationBackdropPath: json["backdrop_path"] ?? "/mDeUmPe4MF35WWlAqj4QFX5UauJ.jpg",
        id: json["id"],
      );
}
