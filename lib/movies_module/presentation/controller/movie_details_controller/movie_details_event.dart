part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}



class GetRecommendingMovieEvent extends MovieDetailsEvent {
  final int id;

  const GetRecommendingMovieEvent(this.id);

  @override
  List<Object> get props => [id];
}
