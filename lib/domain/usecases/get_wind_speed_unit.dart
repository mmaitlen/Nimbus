import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/repositories/settings_repository.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

class GetWindSpeedUnitUseCase implements UseCase<String, NoParams> {
  final SettingsRepository _settingsRepository;

  GetWindSpeedUnitUseCase(this._settingsRepository);

  @override
  Future<DataState<String>> call(NoParams params) {
    return _settingsRepository.getWindSpeedUnit();
  }
}
