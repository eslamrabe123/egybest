import 'package:dartz/dartz.dart';
import 'package:egybest/movies_module/domain/entity/movies.dart';
import 'package:egybest/movies_module/domain/repository/base_movies_repository.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/failure.dart';

class GetTopMoviesUseCase extends BaseUseCases<List<Movies>,NoParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameter parameter) {
    return baseMoviesRepository.getToRatedMovies();
  }
}
