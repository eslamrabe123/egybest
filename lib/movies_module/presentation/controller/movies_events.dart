import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable {
  const MoviesEvents();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvents {

}

class GetTopRatedMoviesEvent extends MoviesEvents {}

class GetPopularMoviesEvent extends MoviesEvents {}

class SearchMovieByNameEvent extends MoviesEvents {
  final String name;

  const SearchMovieByNameEvent(this.name);

  @override
  List<Object> get props => [name];
}