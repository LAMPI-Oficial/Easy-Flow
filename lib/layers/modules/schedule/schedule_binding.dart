import 'package:easyflow/layers/data/provider/schedule_provider.dart';
import 'package:easyflow/layers/modules/schedule/schedule_controller.dart';
import 'package:easyflow/layers/data/repository/schedule_repository.dart';
import 'package:get/get.dart';

class ScheduleBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ScheduleController>(() => ScheduleController(
     ScheduleRepository(ScheduleProvider())));
  }
}