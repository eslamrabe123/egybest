import 'package:egybest/all_module/data/data_source/aii_remote_data_source.dart';
import 'package:egybest/all_module/data/repository/all_repository.dart';
import 'package:egybest/all_module/domain/repository/base_all_repository.dart';
import 'package:egybest/all_module/domain/use_cases/all%20_use_case.dart';
import 'package:egybest/all_module/presntaion/controller/all_bloc.dart';
import 'package:egybest/movies_module/data/data_source/movies_remote_data_source.dart';
import 'package:egybest/movies_module/data/repository/movies_repository.dart';
import 'package:egybest/movies_module/domain/repository/base_movies_repository.dart';
import 'package:egybest/movies_module/domain/use_cases/get_movie_details_use_case.dart';
import 'package:egybest/movies_module/domain/use_cases/get_play_movies_use_case.dart';
import 'package:egybest/movies_module/domain/use_cases/get_recommendations_movies_use_case.dart';
import 'package:egybest/movies_module/domain/use_cases/get_top_rated_movies_uce_case.dart';
import 'package:egybest/movies_module/domain/use_cases/search_movie_by_name.dart';
import 'package:egybest/movies_module/presentation/controller/movie_details_controller/movie_details_bloc.dart';
import 'package:egybest/movies_module/presentation/controller/movies_bloc.dart';
import 'package:egybest/tv_module/data/data_source/tv_shows_remore_data_source.dart';
import 'package:egybest/tv_module/domain/usecases/get_popular_tv_use_case.dart';
import 'package:egybest/tv_module/domain/usecases/get_trending_tv_use_case.dart';
import 'package:get_it/get_it.dart';
import '../../movies_module/domain/use_cases/get_popular_movies_use_case.dart';
import '../../tv_module/data/repository/tv_repository.dart';
import '../../tv_module/domain/repository/base_tv_repository.dart';
import '../../tv_module/domain/usecases/get_top_rated_tv.dart';
import '../../tv_module/presentation/controller/tv_bloc.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator {
  void init() {
    /// ALL BLOC
    serviceLocator.registerFactory(() => AllBloc(serviceLocator()));

    /// MOVIES BLOC
    serviceLocator.registerFactory(() => MoviesBloc(serviceLocator(),
        serviceLocator(), serviceLocator(), serviceLocator()));
    serviceLocator.registerFactory(
        () => MovieDetailsBloc(serviceLocator(), serviceLocator()));

    /// TV SHOWS BLOC
    serviceLocator.registerFactory(
        () => TvBloc(serviceLocator(), serviceLocator(), serviceLocator()));

    /// ALL USE CASES
    serviceLocator.registerLazySingleton(() => AllUseCase(serviceLocator()));

    /// MOVIES USE CASES
    serviceLocator
        .registerLazySingleton(() => GetMovieDetailsUseCase(serviceLocator()));

    serviceLocator.registerLazySingleton(
        () => GetRecommendationsMoviesUseCase(serviceLocator()));

    serviceLocator.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(
        () => SearchMovieByNameUseCase(serviceLocator()));

    serviceLocator
        .registerLazySingleton(() => GetTopMoviesUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => GatPopularMoviesUseCase(serviceLocator()));

    /// TV SHOWS USE CASE
    serviceLocator
        .registerLazySingleton(() => GetPopularTVUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => GetTopRatedTVUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => GetTrendingTvUseCase(serviceLocator()));

    /// ALL REPOSITORY
    serviceLocator.registerLazySingleton<BaseAllRepository>(
        () => AllRepository(serviceLocator()));

    /// MOVIES REPOSITORY
    serviceLocator.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(serviceLocator()));

    /// TV SHOWS REPOSITORY

    serviceLocator.registerLazySingleton<BaseTVRepository>(
        () => TVRepository(serviceLocator()));

    /// All DATA SOURCE
    serviceLocator.registerLazySingleton<BaseAllRemoteDataSource>(
        () => AllRemoteDataSource());

    /// MOVIES DATA SOURCE
    serviceLocator.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());

    /// TV SHOWS DATA SOURCE

    serviceLocator.registerLazySingleton<BaseTVRemoteDataSource>(
        () => TVRemoteDataSource());
  }
}
