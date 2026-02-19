import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/entities/app_error.dart';
import 'package:nimbus/domain/repositories/error_repository.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

class LogErrorUseCase implements UseCase<void, AppError> {
  final ErrorRepository _errorRepository;

  LogErrorUseCase(this._errorRepository);

  @override
  Future<DataState<void>> call(AppError params) {
    return _errorRepository.logError(params);
  }
}
