import 'package:dartz/dartz.dart';
import 'package:egybest/core/base_use_case/base_use_case.dart';
import 'package:egybest/movies_module/domain/entity/movie_details.dart';
import 'package:egybest/movies_module/domain/entity/recommendation.dart';

import '../../../core/error/failure.dart';
import '../entity/movies.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movies>>> getPlayNowMovies();

  Future<Either<Failure, List<Movies>>> getPopularMovies();

  Future<Either<Failure, List<Movies>>> getToRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameter parameter);

  Future<Either<Failure, List<Recommendations>>> getRecommendationsMovies(
      RecommendationsMoviesParameter parameter);


  Future<Either<Failure, List<Movies>>> searchMovieByName(
      SearchMoviesByNameParameter parameter);
}
