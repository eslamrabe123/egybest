import 'package:egybest/movies_module/domain/entity/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel({
    required super.title,
    required super.overview,
    required super.id,
    required super.voteAverage,
    required super.genreIds,
    required super.releaseDate,
    required super.backdropPath,
  });

  factory MoviesModel.fromjson(Map<String, dynamic> json) {
    return MoviesModel(
      title: json["name"] ?? json["title"],
      id: json["id"],
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      overview: json["overview"],
      releaseDate: json["release_date"] ?? json['first_air_date'],
      voteAverage: json["vote_average"].toDouble(),
      backdropPath: json["backdrop_path"] ?? "/rdWmxsgTXhfezuHB1kM3BqhFg1z.jpg",
    );
  }
}
