import 'package:dartz/dartz.dart';
import 'package:egybest/core/error/failure.dart';
import 'package:egybest/tv_module/data/models/tv_model.dart';

abstract class BaseTVRepository {
  Future <Either<Failure, List<TVModel>>> getPopularTv();
  Future <Either<Failure, List<TVModel>>> getTopRatedTv();
  Future <Either<Failure, List<TVModel>>> trendingTv();

}