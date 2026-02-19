import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/entities/app_error.dart';

abstract class ErrorRepository {
  Future<DataState<void>> logError(AppError error);
  Future<DataState<List<AppError>>> getErrors();
  Future<DataState<void>> clearErrorsOlderThan(Duration duration);
}
