import 'package:easyflow/layers/data/model/schedule_model.dart';
import 'package:easyflow/layers/data/provider/schedule_provider.dart';

class ScheduleRepository {
  final ScheduleProvider scheduleProvider;

  ScheduleRepository(this.scheduleProvider);

  Future<List<ScheduleModel>> getAll() {
    return scheduleProvider.getAll();
  }

  Future<ScheduleModel> getById(int id) {
    return scheduleProvider.getById(id);
  }

  Future<int> add(ScheduleModel scheduleModel) {
    return scheduleProvider.add(scheduleModel);
  }

  Future<void> edit(ScheduleModel scheduleModel) {
    return scheduleProvider.edit(scheduleModel);
  }

  Future<void> delete(int id) {
    return scheduleProvider.delete(id);
  }
}
