import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/repositories/settings_repository.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

class GetUpdateIntervalUseCase implements UseCase<Duration, NoParams> {
  final SettingsRepository _settingsRepository;

  GetUpdateIntervalUseCase(this._settingsRepository);

  @override
  Future<DataState<Duration>> call(NoParams params) {
    return _settingsRepository.getUpdateInterval();
  }
}
