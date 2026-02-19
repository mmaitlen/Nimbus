part of 'error_bloc.dart';

abstract class ErrorState extends Equatable {
  const ErrorState();

  @override
  List<Object> get props => [];
}

class ErrorLoading extends ErrorState {}

class ErrorsLoaded extends ErrorState {
  final List<AppError> errors;

  const ErrorsLoaded(this.errors);

  @override
  List<Object> get props => [errors];
}

class ErrorOperationSuccess extends ErrorState {
  final String message;

  const ErrorOperationSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class ErrorOperationFailure extends ErrorState {
  final String message;

  const ErrorOperationFailure(this.message);

  @override
  List<Object> get props => [message];
}
