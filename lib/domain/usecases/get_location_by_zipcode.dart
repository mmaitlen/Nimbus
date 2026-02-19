import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/entities/location.dart';
import 'package:nimbus/domain/repositories/location_repository.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

class GetLocationByZipcodeUseCase implements UseCase<LocationEntity, String> {
  final LocationRepository _locationRepository;

  GetLocationByZipcodeUseCase(this._locationRepository);

  @override
  Future<DataState<LocationEntity>> call(String params) {
    return _locationRepository.getLocationByZipcode(params);
  }
}
