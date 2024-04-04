import 'package:dartz/dartz.dart';
import 'package:egybest/core/error/failure.dart';
import 'package:egybest/movies_module/domain/entity/movies.dart';

abstract class BaseAllRepository {
  Future<Either<Failure,List<Movies>>> getAll();
}