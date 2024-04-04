import 'package:equatable/equatable.dart';

abstract class AllEvent extends Equatable {
  const AllEvent();

  @override
  List<Object> get props => [];
}

class GetAllEvent extends AllEvent {}
