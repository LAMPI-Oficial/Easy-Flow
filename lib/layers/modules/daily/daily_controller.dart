import 'package:easyflow/layers/data/model/daily_model.dart';
import 'package:easyflow/layers/data/repository/daily_repository.dart';
import 'package:get/get.dart';

class DailyController extends GetxController {
  final DailyRepository _dailyRepository;

  DailyController(this._dailyRepository);

  Future<List<DailyModel>>getAll() async => await _dailyRepository.getAll();
}
