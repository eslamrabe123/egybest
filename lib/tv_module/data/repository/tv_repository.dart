import 'package:dartz/dartz.dart';
import 'package:egybest/core/error/failure.dart';
import 'package:egybest/tv_module/data/data_source/tv_shows_remore_data_source.dart';
import 'package:egybest/tv_module/data/models/tv_model.dart';
import 'package:egybest/tv_module/domain/repository/base_tv_repository.dart';

import '../../../core/error/exceptions.dart';

class TVRepository extends BaseTVRepository {
  BaseTVRemoteDataSource baseTVRemoteDataSource;
  TVRepository(this.baseTVRemoteDataSource);
  @override

  Future<Either<Failure, List<TVModel>>> getPopularTv() async{
    try{
      final result = await baseTVRemoteDataSource.getPopularTV();
      return Right(result);
    }on ServerExceptions catch(error){
      return Left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TVModel>>> getTopRatedTv() async{
    final result = await baseTVRemoteDataSource.getTopRatedTV();
    try{
       return Right(result);
    }on ServerExceptions catch(error){
      return Left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TVModel>>> trendingTv() async{
    final result = await baseTVRemoteDataSource.trendingRatedTV();
    try{
      return Right(result);
    }on ServerExceptions catch(error){
      return Left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }

}