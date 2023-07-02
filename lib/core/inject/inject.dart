import 'package:easyflow/layers/data/provider/auth_provider.dart';
import 'package:easyflow/layers/data/provider/daily_provider.dart';
import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:easyflow/layers/data/repository/daily_repository.dart';
import 'package:easyflow/layers/data/service/user_service.dart';
import 'package:easyflow/layers/modules/complaint/complaint_controller.dart';
import 'package:easyflow/layers/modules/daily/daily_controller.dart';
import 'package:easyflow/layers/modules/edit_profile/edit_profile_controller.dart';
import 'package:easyflow/layers/modules/equipment/equipment_controller.dart';
import 'package:easyflow/layers/modules/forgot_password/forgot_password_controller.dart';
import 'package:easyflow/layers/modules/home/home_controller.dart';
import 'package:easyflow/layers/modules/login/login_controller.dart';
import 'package:easyflow/layers/modules/schedule/schedule_controller.dart';
import 'package:easyflow/layers/modules/sign_up/sign_up_controller.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    _initControllers();
    _initServices();
  }

  static void _initControllers() {
    GetIt getIt = GetIt.instance;

    //CONTROLLERS
    getIt.registerFactory<SignUpController>(
      () => SignUpController(
        AuthRepository(
          AuthProvider(),
        ),
      ),
    );

    getIt.registerFactory<LoginController>(
      () => LoginController(
        AuthRepository(
          AuthProvider(),
        ),
      ),
    );

    getIt.registerFactory<EquipmentController>(() => EquipmentController());

    getIt.registerFactory<EditProfileController>(() => EditProfileController());

    getIt.registerFactory<DailyController>(
        () => DailyController(DailyRepository(DailyProvider())));

    getIt.registerFactory<ComplaintController>(
        () => ComplaintController());

    getIt.registerFactory<ForgotPasswordController>(
        () => ForgotPasswordController(AuthRepository(AuthProvider())));

    getIt.registerFactory<HomeController>(() => HomeController());

    getIt.registerFactory<ScheduleController>(() => ScheduleController());
  }

  static _initServices() {
    GetIt getIt = GetIt.instance;

    getIt.registerSingleton<UserService>(
      UserService(),
    );
  }
}
