import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {

<<<<<<< HEAD
final AuthRepository repository;
ForgotPasswordController(this.repository);
=======
  final formKeyEmail = GlobalKey<FormState>();
  final formKeyCheckCode = GlobalKey<FormState>();
  final formKeyNewPassword = GlobalKey<FormState>();
>>>>>>> Dev


<<<<<<< HEAD
}
=======
  sendCode(context) {
    if (formKeyEmail.currentState!.validate()) {
      Navigator.of(context).pushNamed(Routes.FORGOT_PASSWORD_CODE);
    }
  }

  checkCode(context) {
    if (formKeyCheckCode.currentState!.validate()) {
      Navigator.of(context).pushNamed(Routes.FORGOT_PASSWORD_NEW_PASSWORD);
    }
  }

  forgotPassword(context) {
    if (formKeyNewPassword.currentState!.validate()) {
      Navigator.of(context).pushNamed(Routes.FORGOT_PASSWORD_SUCCESS);
    }
  }
}
>>>>>>> Dev
