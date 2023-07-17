import 'package:easyflow/layers/domain/entities/daily_entity.dart';


class DailyController {


  Future<List<DailyEntity>> getDailys() async {
    return [DailyEntity(id: 1, date: DateTime.now(), description: '')];
  }
}
