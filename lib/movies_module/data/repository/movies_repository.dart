import 'package:dartz/dartz.dart';
import 'package:egybest/core/base_use_case/base_use_case.dart';
import 'package:egybest/core/error/exceptions.dart';
import 'package:egybest/core/error/failure.dart';
import 'package:egybest/movies_module/data/data_source/movies_remote_data_source.dart';
import 'package:egybest/movies_module/domain/entity/movie_details.dart';
import 'package:egybest/movies_module/domain/entity/movies.dart';
import 'package:egybest/movies_module/domain/entity/recommendation.dart';
import 'package:egybest/movies_module/domain/repository/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository {
  MoviesRepository(this.baseMoviesRemoteDataSource);

  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  @override
  Future<Either<Failure, List<Movies>>> getPlayNowMovies() async {
    final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on LocalDataBaseFailure catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await baseMoviesRemoteDataSource.getPopularMovies();

    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getToRatedMovies() async {
    final result = await baseMoviesRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameter parameter) async {
    final result = await baseMoviesRemoteDataSource.getMovieDetails(parameter);
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getRecommendationsMovies(
      RecommendationsMoviesParameter parameter) async {
    final result =
        await baseMoviesRemoteDataSource.getRecommendationsMovies(parameter);
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> searchMovieByName(SearchMoviesByNameParameter parameter)async {
   final result = await baseMoviesRemoteDataSource.searchMovieByNameDetails(parameter);
   try{
     return Right(result);
   }on ServerExceptions catch(error){
     return Left(ServerFailure(error.errorMessageModel.statusMessage));
   }
  }
}
