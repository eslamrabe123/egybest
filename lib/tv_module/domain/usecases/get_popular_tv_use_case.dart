import 'package:dartz/dartz.dart';

import 'package:egybest/core/error/failure.dart';
import 'package:egybest/tv_module/domain/entity/tv.dart';
import 'package:egybest/tv_module/domain/repository/base_tv_repository.dart';

import '../../../core/base_use_case/base_use_case.dart';

class GetPopularTVUseCase extends BaseUseCases<List<TV>, NoParameter> {
  BaseTVRepository baseTVRepository;

  GetPopularTVUseCase(this.baseTVRepository);

  @override
  Future<Either<Failure, List<TV>>> call(parameter) async {
    final result = await baseTVRepository.getPopularTv();
    return result;
  }
}
