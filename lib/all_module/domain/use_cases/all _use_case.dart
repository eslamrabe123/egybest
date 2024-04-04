import 'package:dartz/dartz.dart';
import 'package:egybest/core/base_use_case/base_use_case.dart';
import 'package:egybest/core/error/failure.dart';

import '../../../movies_module/domain/entity/movies.dart';
import '../repository/base_all_repository.dart';

class AllUseCase extends BaseUseCases<List<Movies>, NoParameter> {
  BaseAllRepository baseAllRepository;

  AllUseCase(this.baseAllRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameter parameter)  {
    final result =  baseAllRepository.getAll();
    return result;
  }
}
