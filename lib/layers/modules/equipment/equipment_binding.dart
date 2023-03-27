import 'package:easyflow/layers/modules/equipment/equipment_controller.dart';
import 'package:get/get.dart';

class EquipmentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EquipmentController>(() => EquipmentController());
  }
}
