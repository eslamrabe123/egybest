import 'package:egybest/movies_module/domain/entity/movies.dart';
import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';

class AllState extends Equatable {
  ///  All
  final List<Movies> all;
  final RequestState allState;
  final String allErrorMessage;

  printAll() {
    print(all);
  }

  AllState({
    this.all = const [],
    this.allState = RequestState.loading,
    this.allErrorMessage = "",
  });

  AllState copyWith({
    List<Movies>? all,
    RequestState? allState,
    String? allErrorMessage,
  }) {
    return AllState(
      all: all ?? this.all,
      allState: allState ?? this.allState,
      allErrorMessage: allErrorMessage ?? this.allErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        all,
        allState,
        allErrorMessage,
      ];
}
