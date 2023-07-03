import 'package:easyflow/layers/domain/entities/daily_model.dart';


class DailyController {



  Future<List<DailyModel>> getDailys() async {
    return [DailyModel(id: 1, date: DateTime.now())];
  }
}
