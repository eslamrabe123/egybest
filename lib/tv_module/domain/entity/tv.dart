import 'package:equatable/equatable.dart';

class TV extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final double voteAverage;
  final String overview;
  final String releaseDate;
  final List<int> genreIds;

  TV({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
  });

  @override
  List<Object> get props => [
        id,
        title,
        backdropPath,
        voteAverage,
        overview,
        releaseDate,
        genreIds,
      ];
}
