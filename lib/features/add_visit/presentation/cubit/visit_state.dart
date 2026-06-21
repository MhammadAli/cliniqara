import 'package:equatable/equatable.dart';
import '../../domain/entities/visit.dart';

abstract class VisitState extends Equatable {
  const VisitState();

  @override
  List<Object?> get props => [];
}

class VisitInitial extends VisitState {}

class VisitLoading extends VisitState {}

class VisitLoaded extends VisitState {
  final List<Visit> visits;

  const VisitLoaded({required this.visits});

  @override
  List<Object?> get props => [visits];
}

class VisitError extends VisitState {
  final String message;

  const VisitError({required this.message});

  @override
  List<Object?> get props => [message];
}

class VisitActionSuccess extends VisitState {}
