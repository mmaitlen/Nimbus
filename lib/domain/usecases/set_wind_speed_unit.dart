import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/repositories/settings_repository.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

class SetWindSpeedUnitUseCase implements UseCase<void, String> {
  final SettingsRepository _settingsRepository;

  SetWindSpeedUnitUseCase(this._settingsRepository);

  @override
  Future<DataState<void>> call(String params) {
    return _settingsRepository.setWindSpeedUnit(params);
  }
}
