part of 'movie_details_bloc.dart';

@immutable
class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.recommendationsMovies = const [],
    this.recommendationsMoviesState = RequestState.loading,
    this.recommendationMessage = '',
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
  });

  /// MOVIE DETAILS
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;

  /// RECOMMENDATIONS MOVIES
  final List<Recommendations> recommendationsMovies;
  final RequestState recommendationsMoviesState;
  final String recommendationMessage;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendations>? recommendationsMovies,
    RequestState? recommendationsMoviesState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendationsMovies:
          recommendationsMovies ?? this.recommendationsMovies,
      recommendationsMoviesState:
          recommendationsMoviesState ?? this.recommendationsMoviesState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        recommendationsMovies,
        recommendationsMoviesState,
        recommendationMessage,
      ];
}
