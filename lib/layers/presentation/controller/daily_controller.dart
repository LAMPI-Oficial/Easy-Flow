import 'package:easyflow/layers/domain/entities/daily_entity.dart';
import 'package:easyflow/layers/domain/usecases/get_dailys_usecase.dart';


class DailyController {
  final GetDailysUseCase _getDailysUseCase;

  DailyController(this._getDailysUseCase);


  Future<List<DailyEntity>> getDailys() async {
    return _getDailysUseCase.call();
  }
}
