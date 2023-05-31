import 'package:easyflow/layers/data/provider/auth_provider.dart';
import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:easyflow/layers/modules/sign_up/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
        () => SignUpController(AuthRepository(AuthProvider())));
  }
}
