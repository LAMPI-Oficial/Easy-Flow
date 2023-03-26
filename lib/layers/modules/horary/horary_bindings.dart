import 'package:get/get.dart';

import 'horary_controller.dart';

class HoraryBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HoraryController>(() => HoraryController());
  }
}