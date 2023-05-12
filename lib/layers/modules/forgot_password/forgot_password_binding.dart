import 'package:easyflow/layers/data/provider/forgot_password_provider.dart';
import 'package:easyflow/layers/data/repository/forgot_password_repository.dart';
import 'package:easyflow/layers/modules/forgot_password/forgot_password_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(
        ForgotPasswordRepository(
          ForgotPasswordProvider(),
        ),
      ),
    );
  }
}
