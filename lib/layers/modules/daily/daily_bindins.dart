import 'package:easyflow/layers/modules/daily/daily_provider.dart';
import 'package:get/get.dart';
import 'daily_controller.dart';
import 'daily_repository.dart';

class DailyBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<DailyController>(() => DailyController(
     DailyRepository(DailyProvider())));
  }
}