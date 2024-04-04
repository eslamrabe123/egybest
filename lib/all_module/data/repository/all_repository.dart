import 'package:dartz/dartz.dart';
import 'package:egybest/all_module/data/data_source/aii_remote_data_source.dart';
import 'package:egybest/core/error/exceptions.dart';
import 'package:egybest/core/error/failure.dart';
import 'package:egybest/movies_module/domain/entity/movies.dart';

import '../../domain/repository/base_all_repository.dart';

class AllRepository extends BaseAllRepository {
  final BaseAllRemoteDataSource baseAllRemoteDataSource;

  AllRepository(this.baseAllRemoteDataSource);

  @override
  Future<Either<Failure, List<Movies>>> getAll() async {
    final result = await baseAllRemoteDataSource.getAll();
    try {
      return Right(result);
    } on ServerExceptions catch (error) {
      return Left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }
}
