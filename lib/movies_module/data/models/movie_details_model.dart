import 'package:egybest/movies_module/domain/entity/movie_details.dart';

import '../../../core/sheared/model/genres_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.title,
    required super.voteAverage,
    required super.runtime,
    required super.releaseDate,
    required super.overview,
    required super.id,
       super.backdropPath,
    required super.genres,
  });

  factory MovieDetailsModel.fromjson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      title: json["title"],
      voteAverage: json["vote_average"].toDouble(),
      runtime: json["runtime"],
      releaseDate: json["release_date"],
      overview: json["overview"],
      id: json["id"],
      backdropPath: json["backdrop_path"] ?? "/mDeUmPe4MF35WWlAqj4QFX5UauJ.jpg",
      genres: List<GenresModel>.from(
        json["genres"].map((item) {
          return GenresModel.fromjson(item);
        }),
      ),
    );
  }
}
