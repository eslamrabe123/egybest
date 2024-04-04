import 'package:dartz/dartz.dart';
import 'package:egybest/core/base_use_case/base_use_case.dart';
import 'package:egybest/core/error/failure.dart';
import 'package:egybest/movies_module/domain/entity/movie_details.dart';
import 'package:egybest/movies_module/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCases<MovieDetails, MovieDetailsParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
    MovieDetailsParameter parameter,
  ) async {
    return await baseMoviesRepository.getMovieDetails(parameter);
  }
}
