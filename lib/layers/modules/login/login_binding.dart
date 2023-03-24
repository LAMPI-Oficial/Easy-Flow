import 'package:easyflow/layers/data/provider/auth_provider.dart';
import 'package:easyflow/layers/modules/login/login_controller.dart';
import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController(AuthRepository(AuthProvider())));
  }
}
