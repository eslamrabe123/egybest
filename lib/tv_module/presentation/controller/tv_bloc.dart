import 'dart:async';

import 'package:egybest/core/utils/enums.dart';
import 'package:egybest/tv_module/domain/usecases/get_top_rated_tv.dart';
import 'package:egybest/tv_module/domain/usecases/get_trending_tv_use_case.dart';
import 'package:egybest/tv_module/presentation/controller/tv_event.dart';
import 'package:egybest/tv_module/presentation/controller/tv_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../domain/usecases/get_popular_tv_use_case.dart';

class TvBloc extends Bloc<TVEvents, TVStates> {
  final GetPopularTVUseCase getPopularTVUseCase;
  final GetTopRatedTVUseCase getTopRatedTVUseCase;
  final GetTrendingTvUseCase getTrendingTvUseCase;

  TvBloc(this.getPopularTVUseCase, this.getTopRatedTVUseCase, this.getTrendingTvUseCase) : super(TVStates()) {
    on<GetPopularTVEvent>(getPopularTVEvent);
    on<GetTopRatedTVEvent>(getTopRatedTVEvent);
    on<GetTrendingTVEvent>(getTrendingTVEvent);
  }

  Future<void> getPopularTVEvent(GetPopularTVEvent event, Emitter<TVStates> emit) async {
    final result = await getPopularTVUseCase(const NoParameter());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularTVState: RequestState.error,
          popularTVErrorMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularTVState: RequestState.loaded,
          popularTV: r,
        ),
      ),
    );
  }

  FutureOr<void> getTopRatedTVEvent(GetTopRatedTVEvent event, Emitter<TVStates> emit) async {
    final result = await getTopRatedTVUseCase(const NoParameter());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedTVState: RequestState.error,
          topRatedTVErrorMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedTVState: RequestState.loaded,
          topRatedTV: r,
        ),
      ),
    );
  }

  FutureOr<void> getTrendingTVEvent(GetTrendingTVEvent event, Emitter<TVStates> emit) async {
    final result = await getTrendingTvUseCase(const NoParameter());
    result.fold(
      (l) => emit(
        state.copyWith(
          trendingTVState: RequestState.error,
          trendingTVErrorMessage: l.message,
        )
      ),
      (r) => emit(
        state.copyWith(
          trendingTVState: RequestState.loaded,
           trendingTV: r,
        )
      ),
    );
  }
}
