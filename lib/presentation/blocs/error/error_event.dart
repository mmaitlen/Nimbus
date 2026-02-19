part of 'error_bloc.dart';

abstract class ErrorEvent extends Equatable {
  const ErrorEvent();

  @override
  List<Object> get props => [];
}

class LogAppError extends ErrorEvent {
  final AppError error;

  const LogAppError(this.error);

  @override
  List<Object> get props => [error];
}

class GetAppErrors extends ErrorEvent {}

class ClearOldErrors extends ErrorEvent {
  final Duration duration;

  const ClearOldErrors(this.duration);

  @override
  List<Object> get props => [duration];
}
