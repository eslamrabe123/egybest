import 'package:dartz/dartz.dart';
import 'package:egybest/core/base_use_case/base_use_case.dart';
import 'package:egybest/core/error/failure.dart';
import 'package:egybest/tv_module/data/models/tv_model.dart';
import 'package:egybest/tv_module/domain/repository/base_tv_repository.dart';

class GetTrendingTvUseCase extends BaseUseCases <List<TVModel> , NoParameter>{
  BaseTVRepository baseTVRepository;

  GetTrendingTvUseCase(this.baseTVRepository);

  @override
  Future<Either<Failure, List<TVModel>>> call(NoParameter parameter)async {
   final result = await baseTVRepository.trendingTv();
   return result;
  }

}