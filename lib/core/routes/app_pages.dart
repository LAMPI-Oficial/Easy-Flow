// ignore_for_file: prefer_const_constructors

import 'package:easyflow/layers/modules/complaint/complaint_binding.dart';
import 'package:easyflow/layers/modules/complaint/pages/complaint_page.dart';
import 'package:easyflow/layers/modules/equipment/equipment_binding.dart';
import 'package:easyflow/layers/modules/equipment/pages/equipment_request_page.dart';
import 'package:easyflow/layers/modules/equipment/pages/equipments_page.dart';
import 'package:easyflow/layers/modules/forgot_password/forgot_password_binding.dart';
import 'package:easyflow/layers/modules/home/home.dart';
import 'package:easyflow/layers/modules/menu/menu_page.dart';
import 'package:easyflow/layers/modules/splash_screen/splash_screen_page.dart';
import 'package:easyflow/layers/modules/login/login_binding.dart';
import 'package:easyflow/layers/modules/login/login_page.dart';
import 'package:easyflow/layers/modules/sign_up/pages/sign_up_page.dart';
import 'package:easyflow/layers/modules/sign_up/pages/success_sign_up_page.dart';
import 'package:easyflow/layers/modules/sign_up/sign_up_binding.dart';
import 'package:easyflow/layers/modules/forgot_password/pages/email_forgot_password_page.dart';
import 'package:easyflow/layers/modules/forgot_password/pages/code_forgot_password_page.dart';
import 'package:easyflow/layers/modules/forgot_password/pages/new_password_forgot_password_page.dart';
import 'package:easyflow/layers/modules/forgot_password/pages/success_forgot_password_page.dart';
import 'package:easyflow/layers/modules/home/bindings/home_binding.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:get/route_manager.dart';
import '../../layers/modules/horary/horary_page.dart';
import 'package:easyflow/layers/modules/about/pages/about_page.dart';
import '../../layers/modules/add_horary/add_horary_page.dart';
part './app_routes.dart';


part './app_routes.dart';

abstract class AppPages {
  static const initialRoute = Routes.SPLASH_SCREEN;
  static final pages = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreenPage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP_SUCCESS,
      page: () => SuccessSignUpPage(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD_EMAIL,
      page: () => EmailForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD_CODE,
      page: () => CodeForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD_NEW_PASSWORD,
      page: () => NewPasswordForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD_SUCCESS,
      page: () => SuccessForgotPasswordPage(),
    ),
    GetPage(
      name: Routes.ADD_HORARY,
      page: () => AddHoraryPage(),
    ),
    GetPage(
      name: Routes.COMPLAINT,
      page: () => ComplaintPage(),
      binding: ComplaintBinding(),
    ),
    GetPage(
      name: Routes.EQUIPMENT,
      page: () => EquipmentPage(),
      binding: EquipmentBinding(),
      transition: Transition.fadeIn,
      fullscreenDialog: GetPlatform.isAndroid,
      transitionDuration: const Duration(
        milliseconds: 300,
      ),
    ),
    GetPage(
      name: Routes.EQUIPMENT_REQUEST,
      page: () => EquipmentRequestPage(),
      binding: EquipmentBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => Home(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: Routes.LISTING_HORARY,
      page: () => HoraryPage(),
      fullscreenDialog: GetPlatform.isAndroid,
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(
        milliseconds: 400,
      ),
    ),
    GetPage(
      name: Routes.ABOUT,
      page: () => AboutPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(
        milliseconds: 300,
      ),
    ),
    GetPage(
      name: Routes.MENU,
      page: () => MenuPage(),
    )
  ];
}
