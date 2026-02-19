import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/data/local/app_database.dart';
import 'package:nimbus/data/local/daos/error_dao.dart';
import 'package:nimbus/domain/entities/app_error.dart';
import 'package:nimbus/domain/repositories/error_repository.dart';
import 'package:collection/collection.dart'; // For firstWhereOrNull

class ErrorRepositoryImpl implements ErrorRepository {
  final ErrorDao _errorDao;

  ErrorRepositoryImpl(this._errorDao);

  @override
  Future<DataState<void>> clearErrorsOlderThan(Duration duration) async {
    try {
      final threshold = DateTime.now().subtract(duration);
      await _errorDao.deleteErrorsOlderThan(threshold);
      return const DataSuccess(null);
    } catch (e) {
      return DataFailed(Exception(e.toString()));
    }
  }

  @override
  Future<DataState<List<AppError>>> getErrors() async {
    try {
      final errorEntries = await _errorDao.getErrors();
      final appErrors = errorEntries
          .map(
            (e) => AppError(
              timestamp: e.timestamp,
              apiEndpoint: e.apiEndpoint,
              statusCode: e.statusCode,
              errorMessage: e.errorMessage,
              locationIdentifier: e.locationIdentifier,
              requestParameters: e.requestParameters != null
                  ? Map<String, dynamic>.from(
                      // Placeholder for parsing JSON string back to Map
                      // This needs proper JSON decoding
                      {})
                  : null,
            ),
          )
          .toList();
      return DataSuccess(appErrors);
    } catch (e) {
      return DataFailed(Exception(e.toString()));
    }
  }

  @override
  Future<DataState<void>> logError(AppError error) async {
    try {
      await _errorDao.insertError(
        AppErrorsCompanion.insert(
          timestamp: error.timestamp,
          apiEndpoint: error.apiEndpoint,
          statusCode: Value(error.statusCode),
          errorMessage: error.errorMessage,
          locationIdentifier: Value(error.locationIdentifier),
          requestParameters: Value(
              error.requestParameters != null ? error.requestParameters.toString() : null), // Convert Map to JSON string
        ),
      );
      return const DataSuccess(null);
    } catch (e) {
      return DataFailed(Exception(e.toString()));
    }
  }
}
