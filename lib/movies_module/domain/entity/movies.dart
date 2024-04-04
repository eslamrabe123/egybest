import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final double voteAverage;
  final String overview;
  final String releaseDate;
  final List<int> genreIds;

 const Movies({
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.id,
    required this.voteAverage,
    required this.genreIds,
    required this.releaseDate,
  });

  @override
  List<Object> get props => [
        id,
        title,
        voteAverage,
        overview,
        genreIds,
      ];
}
