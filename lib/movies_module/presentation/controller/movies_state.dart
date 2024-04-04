import 'package:egybest/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/movie_details.dart';
import '../../domain/entity/movies.dart';

class MoviesState extends Equatable {
  /// NOW PLAYING MOVIES
  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMessage;

  /// <<< ERROR MESSAGE

  /// POPULAR MOVIES

  final List<Movies> popularMovies;
  final RequestState popularMoviesState;
  final String popularMessage;

  /// <<< ERROR MESSAGE

  /// TOP RATED MOVIES

  final List<Movies> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMessage;

  /// <<< ERROR MESSAGE

  /// SEARCH MOVIES BY NAME

  final List<Movies> searchMoviesRequest;
  final RequestState searchMoviesState;
  final String searchMoviesErrorMessage;


  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesState = RequestState.loading,
    this.nowPlayingMessage = "",
    this.popularMovies = const [],
    this.popularMoviesState = RequestState.loading,
    this.popularMessage = "",
    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestState.loading,
    this.topRatedMessage = "",
    this.searchMoviesRequest = const [],
    this.searchMoviesState = RequestState.loading,
    this.searchMoviesErrorMessage = "",
  });

  MoviesState copyWith({
    List<Movies>? nowPlayingMovies,
    RequestState? nowPlayingMoviesState,
    String? nowPlayingMessage,
    List<Movies>? popularMovies,
    RequestState? popularMoviesState,
    String? popularMessage,
    List<Movies>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMessage,
    List<Movies>? searchMoviesRequest,
    RequestState? searchMoviesState,
    String? searchMoviesErrorMessage,
  }) {
    return MoviesState(
      nowPlayingMoviesState:
      nowPlayingMoviesState ?? this.nowPlayingMoviesState,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      popularMessage: popularMessage ?? this.popularMessage,
      searchMoviesRequest: searchMoviesRequest ?? this.searchMoviesRequest,
      searchMoviesState: searchMoviesState ?? this.searchMoviesState,
      searchMoviesErrorMessage:
      searchMoviesErrorMessage ?? this.searchMoviesErrorMessage,
    );
  }

  @override
  List<Object> get props =>
      [
        nowPlayingMovies,
        nowPlayingMoviesState,
        nowPlayingMessage,
        popularMovies,
        popularMoviesState,
        popularMessage,
        topRatedMovies,
        topRatedMoviesState,
        topRatedMessage,
        searchMoviesRequest,
        searchMoviesState,
        searchMoviesErrorMessage,
      ];
}
