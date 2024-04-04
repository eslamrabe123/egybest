import 'dart:async';

import 'package:egybest/core/base_use_case/base_use_case.dart';
import 'package:egybest/core/utils/enums.dart';
import 'package:egybest/movies_module/presentation/controller/movies_events.dart';
import 'package:egybest/movies_module/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_play_movies_use_case.dart';
import '../../domain/use_cases/get_popular_movies_use_case.dart';
import '../../domain/use_cases/get_top_rated_movies_uce_case.dart';
import '../../domain/use_cases/search_movie_by_name.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GatPopularMoviesUseCase gatPopularMoviesUseCase;
  final GetTopMoviesUseCase getTopMoviesUseCase;
  final SearchMovieByNameUseCase searchMovieByNameUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.gatPopularMoviesUseCase,
    this.getTopMoviesUseCase,
    this.searchMovieByNameUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
    on<SearchMovieByNameEvent>(_search);
  }

  Future<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopMoviesUseCase(const NoParameter());
    result.fold(
      (l) => emit(state.copyWith(
        topRatedMoviesState: RequestState.error,
        topRatedMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        topRatedMoviesState: RequestState.loaded,
        topRatedMovies: r,
      )),
    );
  }

  Future<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await gatPopularMoviesUseCase(const NoParameter());
    result.fold(
      (l) => emit(state.copyWith(
        popularMoviesState: RequestState.error,
        popularMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        popularMoviesState: RequestState.loaded,
        popularMovies: r,
      )),
    );
  }

  Future<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameter());
    result.fold(
      (l) => emit(state.copyWith(
        nowPlayingMoviesState: RequestState.error,
        nowPlayingMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        nowPlayingMoviesState: RequestState.loaded,
        nowPlayingMovies: r,
      )),
    );
  }



  FutureOr<void> _search(SearchMovieByNameEvent event, Emitter<MoviesState> emit) async{
    final result = await searchMovieByNameUseCase(SearchMoviesByNameParameter(name: event.name));
    result.fold(
          (l) => emit(state.copyWith(
        searchMoviesState: RequestState.error,
        searchMoviesErrorMessage: l.message,
      )),
          (r) => emit(state.copyWith(
        searchMoviesState: RequestState.loaded,
        searchMoviesRequest: r,
      )),
    );
  }
}
