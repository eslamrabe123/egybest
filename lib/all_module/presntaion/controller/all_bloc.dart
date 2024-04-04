import 'package:egybest/core/base_use_case/base_use_case.dart';
import 'package:egybest/core/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/all _use_case.dart';
import 'all_event.dart';
import 'all_state.dart';

class AllBloc extends Bloc<AllEvent, AllState> {
  final AllUseCase allUseCase;

  AllBloc(this.allUseCase) : super(AllState()) {
    on<GetAllEvent>(getAll);
  }

  Future<void> getAll(GetAllEvent event, Emitter<AllState> emit) async {
    final result = await allUseCase(NoParameter());
    result.fold(
      (l) => emit(state.copyWith(
        allState: RequestState.error,
        allErrorMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          allState: RequestState.loaded,
          all: r,
        ),
      ),
    );
  }
}
