import 'package:egybest/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/tv.dart';

class TVStates extends Equatable {
  ///  POPULAR TVs
  final List<TV> popularTV;
  final RequestState popularTVState;
  final String popularTVErrorMessage;

  ///  TOP RATED TVs
  final List<TV> topRatedTV;
  final RequestState topRatedTVState;
  final String topRatedTVErrorMessage;

  ///  TRENDING TVs
  final List<TV> trendingTV;
  final RequestState trendingTVState;
  final String trendingTVErrorMessage;

  TVStates({
    this.popularTV = const [],
    this.popularTVState = RequestState.loading,
    this.popularTVErrorMessage = '',
    this.topRatedTVErrorMessage = "",
    this.topRatedTVState = RequestState.loading,
    this.topRatedTV = const [],
    this.trendingTV = const [],
    this.trendingTVState = RequestState.loading,
    this.trendingTVErrorMessage = "",
  });

  TVStates copyWith({
    List<TV>? popularTV,
    RequestState? popularTVState,
    String? popularTVErrorMessage,
    List<TV>? topRatedTV,
    RequestState? topRatedTVState,
    String? topRatedTVErrorMessage,
    List<TV>? trendingTV,
    RequestState? trendingTVState,
    String? trendingTVErrorMessage,
  }) {
    return TVStates(
      popularTV: popularTV ?? this.popularTV,
      popularTVState: popularTVState ?? this.popularTVState,
      popularTVErrorMessage:
          popularTVErrorMessage ?? this.popularTVErrorMessage,
      topRatedTV: topRatedTV ?? this.topRatedTV,
      topRatedTVState: topRatedTVState ?? this.topRatedTVState,
      topRatedTVErrorMessage:
          topRatedTVErrorMessage ?? this.topRatedTVErrorMessage,
      trendingTV: trendingTV ?? this.trendingTV,
      trendingTVState: trendingTVState ?? this.trendingTVState,
      trendingTVErrorMessage:
          trendingTVErrorMessage ?? this.trendingTVErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        popularTV,
        popularTVState,
        popularTVErrorMessage,
        topRatedTV,
        topRatedTVState,
        topRatedTVErrorMessage,
        trendingTV,
        trendingTVState,
        trendingTVErrorMessage,
      ];
}
