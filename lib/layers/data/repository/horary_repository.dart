import 'package:easyflow/layers/data/model/Schedule_model.dart';
import 'package:easyflow/layers/data/model/user_model.dart';
import 'package:easyflow/layers/data/provider/schedule.dart';

class ScheduleRepository {
  final ScheduleProvider scheduleProvider;

  ScheduleRepository(this.scheduleProvider);

  Future<List<ScheduleModel>> getAll(UserModel userModel) {
    return scheduleProvider.getAll(userModel);
  }

  Future<ScheduleModel> getId(int id) {
    return scheduleProvider.getId(id);
  }

  Future<int> add(ScheduleModel scheduleModel) {
    return scheduleProvider.add(scheduleModel);
  }

  Future<void> edit(ScheduleModel scheduleModel) {
    return scheduleProvider.edit(scheduleModel);
  }

  Future<void> del(int id) {
    return scheduleProvider.del(id);
  }
}
