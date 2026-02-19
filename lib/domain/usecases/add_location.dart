import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/entities/location.dart';
import 'package:nimbus/domain/repositories/location_repository.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

class AddLocationUseCase implements UseCase<LocationEntity, LocationEntity> {
  final LocationRepository _locationRepository;

  AddLocationUseCase(this._locationRepository);

  @override
  Future<DataState<LocationEntity>> call(LocationEntity params) {
    return _locationRepository.addLocation(params);
  }
}
