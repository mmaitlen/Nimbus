import 'package:nimbus/core/utils/data_state.dart';
import 'package:nimbus/domain/entities/location.dart';
import 'package:nimbus/domain/repositories/location_repository.dart';
import 'package:nimbus/domain/usecases/usecase.dart';

class GetDefaultLocationUseCase implements UseCase<LocationEntity?, NoParams> {
  final LocationRepository _locationRepository;

  GetDefaultLocationUseCase(this._locationRepository);

  @override
  Future<DataState<LocationEntity?>> call(NoParams params) {
    return _locationRepository.getDefaultLocation();
  }
}
