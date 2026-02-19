import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/repositories/settings_repository.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

class SetUpdateIntervalUseCase implements UseCase<void, Duration> {
  final SettingsRepository _settingsRepository;

  SetUpdateIntervalUseCase(this._settingsRepository);

  @override
  Future<DataState<void>> call(Duration params) {
    return _settingsRepository.setUpdateInterval(params);
  }
}
