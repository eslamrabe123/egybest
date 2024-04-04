import 'package:dartz/dartz.dart';
import 'package:egybest/core/base_use_case/base_use_case.dart';
import 'package:egybest/core/error/failure.dart';
import 'package:egybest/movies_module/domain/entity/movies.dart';
import 'package:egybest/movies_module/domain/repository/base_movies_repository.dart';

class SearchMovieByNameUseCase extends BaseUseCases<List<Movies>, SearchMoviesByNameParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  SearchMovieByNameUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(SearchMoviesByNameParameter parameter) async {
    return  await baseMoviesRepository.searchMovieByName(parameter);

  }

}

