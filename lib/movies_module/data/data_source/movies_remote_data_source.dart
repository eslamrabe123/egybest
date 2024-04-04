import 'package:dio/dio.dart';
import 'package:egybest/core/base_use_case/base_use_case.dart';
import 'package:egybest/core/error/exceptions.dart';
import 'package:egybest/core/network/api_constance.dart';
import 'package:egybest/movies_module/data/models/movie_details_model.dart';
import 'package:egybest/movies_module/data/models/movies_model.dart';
import 'package:egybest/movies_module/data/models/recommendations_model.dart';
import 'package:egybest/movies_module/domain/entity/recommendation.dart';
import '../../../core/network/error_message_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();

  Future<List<MoviesModel>> getTopRatedMovies();

  Future<List<MoviesModel>> getPopularMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameter parameter);

  Future<List<MoviesModel>> searchMovieByNameDetails(
      SearchMoviesByNameParameter parameter);

  Future<List<Recommendations>> getRecommendationsMovies(
      RecommendationsMoviesParameter parameter);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  final dio = Dio();

  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await dio.get(ApiConstance.nowPlayingMoviesApiPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data["results"] as List).map(
          (e) => MoviesModel.fromjson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromjson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await dio.get(ApiConstance.popularMoviesApiPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data["results"] as List).map(
          (e) => MoviesModel.fromjson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromjson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await dio.get(ApiConstance.topRatedMoviesApiPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data["results"] as List).map(
          (e) => MoviesModel.fromjson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromjson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameter parameter) async {
    final response = await dio.get(ApiConstance.movieDetailsPath(parameter.id));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromjson(
        response.data,
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromjson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationsModel>> getRecommendationsMovies(
      RecommendationsMoviesParameter parameter) async {
    final response =
        await dio.get(ApiConstance.recommendationMoviesPath(parameter.id));
    if (response.statusCode == 200) {
      return List<RecommendationsModel>.from(
        (response.data["results"] as List).map(
          (e) => RecommendationsModel.fromjson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromjson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> searchMovieByNameDetails(
      SearchMoviesByNameParameter parameter) async {
    final response =
        await dio.get(ApiConstance.searchMoviesByNamePath(parameter.name));
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data["results"] as List).map(
              (e) => MoviesModel.fromjson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromjson(response.data),
      );
    }
  }
}
