import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/entities/app_error.dart';
import 'package:nimbus/domain/repositories/error_repository.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

class GetErrorsUseCase implements UseCase<List<AppError>, NoParams> {
  final ErrorRepository _errorRepository;

  GetErrorsUseCase(this._errorRepository);

  @override
  Future<DataState<List<AppError>>> call(NoParams params) {
    return _errorRepository.getErrors();
  }
}
