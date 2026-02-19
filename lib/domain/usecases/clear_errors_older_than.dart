import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/repositories/error_repository.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

class ClearErrorsOlderThanUseCase implements UseCase<void, Duration> {
  final ErrorRepository _errorRepository;

  ClearErrorsOlderThanUseCase(this._errorRepository);

  @override
  Future<DataState<void>> call(Duration params) {
    return _errorRepository.clearErrorsOlderThan(params);
  }
}
