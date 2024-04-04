import '../../domain/entity/tv.dart';

class TVModel extends TV {
  TVModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.voteAverage,
    required super.overview,
    required super.releaseDate,
    required super.genreIds,
  });

  factory TVModel.fromjson(Map<String, dynamic> json) => TVModel(
        id: json["id"],
        title: json["name"],
        backdropPath: json["backdrop_path"]?? "/rdWmxsgTXhfezuHB1kM3BqhFg1z.jpg",
        voteAverage: json["vote_average"],
        overview: json["overview"],
        releaseDate: json["first_air_date"],
        genreIds:List<int>.from(json["genre_ids"].map((e) => e)),
      );
}
