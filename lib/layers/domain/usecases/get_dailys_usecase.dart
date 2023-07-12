import 'package:easyflow/layers/domain/entities/daily_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_dailys_repository.dart';

abstract class GetDailysUseCase {
  Future<List<DailyEntity>> call();
}

class GetDailysUseCaseImpl
    implements GetDailysUseCase {
  final GetDailysRepository
  _getDailysRepository;

  GetDailysUseCaseImpl(
      this._getDailysRepository);

  @override
  Future<List<DailyEntity>> call() async {
    return _getDailysRepository();
  }
}
