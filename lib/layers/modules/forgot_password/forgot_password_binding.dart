import 'package:easyflow/layers/data/provider/auth_provider.dart';
import 'package:easyflow/layers/modules/forgot_password/forgot_password_controller.dart';
import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:get/get.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
        () => ForgotPasswordController(AuthRepository(AuthProvider())));
  }
}
