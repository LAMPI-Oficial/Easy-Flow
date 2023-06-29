import 'package:easyflow/layers/data/provider/auth_provider.dart';
import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:easyflow/layers/modules/complaint/complaint_controller.dart';
import 'package:get/get.dart';

class ComplaintBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComplaintController>(
        () => ComplaintController(AuthRepository(AuthProvider())));
  }
}
