import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class BaseUseCases<T, Parameter> {
  Future<Either<Failure, T>> call(Parameter parameter);
}

class MovieDetailsParameter extends Equatable {
  final int id;

  const MovieDetailsParameter({required this.id});

  @override
  List<Object> get props => [id];
}

class RecommendationsMoviesParameter extends Equatable {
  final int id;

  const RecommendationsMoviesParameter({required this.id});

  @override
  List<Object> get props => [id];
}

class SearchMoviesByNameParameter extends Equatable {
  final String name;

  const SearchMoviesByNameParameter({required this.name});

  @override
  List<Object> get props => [name];
}

class NoParameter extends Equatable {
  const NoParameter();

  @override
  List<Object> get props => [];
}
