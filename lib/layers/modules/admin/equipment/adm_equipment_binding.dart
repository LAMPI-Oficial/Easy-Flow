import 'package:get/get.dart';

import 'adm_equipments_controller.dart';

class AdmEquipmentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdmEquipmentsController>(() => AdmEquipmentsController());
  }
}
