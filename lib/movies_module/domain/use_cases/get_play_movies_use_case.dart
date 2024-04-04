import 'package:dartz/dartz.dart';
import 'package:egybest/movies_module/domain/entity/movies.dart';
import 'package:egybest/movies_module/domain/repository/base_movies_repository.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCases<List<Movies>,NoParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameter parameter) async {
    return await baseMoviesRepository.getPlayNowMovies();
  }
}
