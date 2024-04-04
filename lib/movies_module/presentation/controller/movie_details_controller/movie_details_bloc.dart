import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:egybest/core/utils/enums.dart';
import 'package:egybest/movies_module/domain/entity/recommendation.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../domain/entity/movie_details.dart';
import '../../../domain/use_cases/get_movie_details_use_case.dart';
import '../../../domain/use_cases/get_recommendations_movies_use_case.dart';
import '../../../domain/use_cases/search_movie_by_name.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase movieDetailsUseCase;
  final GetRecommendationsMoviesUseCase getRecommendationsMoviesUseCase;

  MovieDetailsBloc(
      this.movieDetailsUseCase, this.getRecommendationsMoviesUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendingMovieEvent>(_getRecommending);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await movieDetailsUseCase(MovieDetailsParameter(id: event.id));
    result.fold(
      (l) => emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        movieDetailsState: RequestState.loaded,
        movieDetails: r,
      )),
    );
  }

  FutureOr<void> _getRecommending(
      GetRecommendingMovieEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationsMoviesUseCase(
        RecommendationsMoviesParameter(id: event.id));
    result.fold(
      (l) => emit(state.copyWith(
        recommendationsMoviesState: RequestState.error,
        recommendationMessage: l.message,
      )),
      (r) => emit(state.copyWith(
          recommendationsMoviesState: RequestState.loaded,
          recommendationsMovies: r)),
    );
  }
}
