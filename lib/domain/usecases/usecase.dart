import 'package:nimbus/core/utils/data_state.dart';

abstract class UseCase<Type, Params> {
  Future<DataState<Type>> call(Params params);
}

class NoParams {}
