import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final String title;
  final double voteAverage;
  final int runtime;
  final String releaseDate;
  final String overview;
  final int id;
  final String? backdropPath;
  final List<Genres> genres;

  const MovieDetails({
    required this.title,
    required this.voteAverage,
    required this.runtime,
    required this.releaseDate,
    required this.overview,
    required this.id,
     this.backdropPath,
    required this.genres,
  });

  @override
  List<Object?> get props =>
      [
        title,
        voteAverage,
        runtime,
        releaseDate,
        overview,
        id,
        backdropPath,
        genres,
      ];
}
