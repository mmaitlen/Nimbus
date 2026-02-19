import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/repositories/settings_repository.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

class GetTemperatureUnitUseCase implements UseCase<String, NoParams> {
  final SettingsRepository _settingsRepository;

  GetTemperatureUnitUseCase(this._settingsRepository);

  @override
  Future<DataState<String>> call(NoParams params) {
    return _settingsRepository.getTemperatureUnit();
  }
}
