import 'package:dartz/dartz.dart';
import 'package:egybest/core/base_use_case/base_use_case.dart';
import 'package:egybest/core/error/failure.dart';
import 'package:egybest/movies_module/domain/entity/recommendation.dart';
import 'package:egybest/movies_module/domain/repository/base_movies_repository.dart';

class GetRecommendationsMoviesUseCase extends BaseUseCases<List<Recommendations>, RecommendationsMoviesParameter> {
  final BaseMoviesRepository baseMoviesRepository;
   GetRecommendationsMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendations>>> call(RecommendationsMoviesParameter parameter) async{
    return await baseMoviesRepository.getRecommendationsMovies(parameter);

  }

}