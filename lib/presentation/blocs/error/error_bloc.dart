import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/entities/app_error.dart';
import 'package:nimbus/domain/usecases/clear_errors_older_than.dart';
import 'package:nimbus/domain/usecases/get_errors.dart';
import 'package:nimbus/domain/usecases/log_error.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

part 'error_event.dart';
part 'error_state.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  final LogErrorUseCase _logErrorUseCase;
  final GetErrorsUseCase _getErrorsUseCase;
  final ClearErrorsOlderThanUseCase _clearErrorsOlderThanUseCase;

  ErrorBloc(this._logErrorUseCase, this._getErrorsUseCase,
      this._clearErrorsOlderThanUseCase)
      : super(ErrorLoading()) {
    on<LogAppError>(onLogAppError);
    on<GetAppErrors>(onGetAppErrors);
    on<ClearOldErrors>(onClearOldErrors);
  }

  void onLogAppError(LogAppError event, Emitter<ErrorState> emit) async {
    final dataState = await _logErrorUseCase(event.error);
    if (dataState is DataSuccess) {
      emit(const ErrorOperationSuccess('Error logged successfully.'));
    } else {
      emit(ErrorOperationFailure(
          dataState.error?.toString() ?? 'Failed to log error.'));
    }
  }

  void onGetAppErrors(GetAppErrors event, Emitter<ErrorState> emit) async {
    emit(ErrorLoading());
    final dataState = await _getErrorsUseCase(const NoParams());
    if (dataState is DataSuccess && dataState.data != null) {
      emit(ErrorsLoaded(dataState.data!));
    } else {
      emit(ErrorOperationFailure(
          dataState.error?.toString() ?? 'Failed to retrieve errors.'));
    }
  }

  void onClearOldErrors(ClearOldErrors event, Emitter<ErrorState> emit) async {
    final dataState = await _clearErrorsOlderThanUseCase(event.duration);
    if (dataState is DataSuccess) {
      emit(const ErrorOperationSuccess('Old errors cleared successfully.'));
      add(GetAppErrors()); // Refresh the list of errors
    } else {
      emit(ErrorOperationFailure(
          dataState.error?.toString() ?? 'Failed to clear old errors.'));
    }
  }
}
