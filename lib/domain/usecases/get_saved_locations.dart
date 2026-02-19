import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/entities/location.dart';
import 'package:nimbus/domain/repositories/location_repository.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

class GetSavedLocationsUseCase implements UseCase<List<LocationEntity>, NoParams> {
  final LocationRepository _locationRepository;

  GetSavedLocationsUseCase(this._locationRepository);

  @override
  Future<DataState<List<LocationEntity>>> call(NoParams params) {
    return _locationRepository.getSavedLocations();
  }
}
