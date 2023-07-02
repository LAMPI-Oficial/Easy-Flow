import 'package:easyflow/layers/data/model/daily_model.dart';
import 'package:easyflow/layers/data/repository/daily_repository.dart';

class DailyController {
  final DailyRepository _dailyRepository;

  DailyController(this._dailyRepository);

  Future<List<DailyModel>> getDailys() async {
    return [DailyModel(id: 1, date: DateTime.now())];
  }
}
