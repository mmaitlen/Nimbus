import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/repositories/location_repository.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

class SetDefaultLocationUseCase implements UseCase<void, int> {
  final LocationRepository _locationRepository;

  SetDefaultLocationUseCase(this._locationRepository);

  @override
  Future<DataState<void>> call(int params) {
    return _locationRepository.setDefaultLocation(params);
  }
}
