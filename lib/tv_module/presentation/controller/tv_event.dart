import 'package:equatable/equatable.dart';

abstract class TVEvents extends Equatable {
  const TVEvents();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetTrendingTVEvent extends TVEvents {}

class GetTopRatedTVEvent extends TVEvents {}

class GetPopularTVEvent extends TVEvents {}
