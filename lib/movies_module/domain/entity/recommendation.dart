import 'package:equatable/equatable.dart';

class Recommendations extends Equatable {
  final String? recommendationBackdropPath;
  final int id;

  const Recommendations({
     this.recommendationBackdropPath,
    required this.id,
  });

  @override
  List<Object?> get props => [
    recommendationBackdropPath,
        id,
      ];
}
