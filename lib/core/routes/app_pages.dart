// ignore_for_file: prefer_const_constructors
import 'package:easyflow/layers/modules/about/about_page.dart';
import 'package:easyflow/layers/modules/complaint/complaint_binding.dart';
import 'package:easyflow/layers/modules/complaint/pages/complaints_page.dart';
import 'package:easyflow/layers/modules/schedule/pages/add_schedule_page.dart';
import 'package:easyflow/layers/modules/schedule/pages/schedule_page.dart';
import 'package:easyflow/layers/modules/schedule/schedule_binding.dart';
import 'package:easyflow/layers/modules/complaint/pages/add_complaint_page.dart';
import 'package:easyflow/layers/modules/edit_profile/edit_profile_binding.dart';
import 'package:easyflow/layers/modules/edit_profile/edit_profile_page.dart';
import 'package:easyflow/layers/modules/equipment/equipment_binding.dart';
import 'package:easyflow/layers/modules/equipment/pages/equipment_request_page.dart';
import 'package:easyflow/layers/modules/forgot_password/forgot_password_binding.dart';
import 'package:easyflow/layers/modules/home/home_binding.dart';
import 'package:easyflow/layers/modules/home/pages/home_page.dart';
import 'package:easyflow/layers/modules/sign_up/pages/password_sign_up_page.dart';
import 'package:easyflow/layers/modules/sign_up/pages/address_sign_up_page.dart';
import 'package:easyflow/layers/modules/menu/menu_page.dart';
import 'package:easyflow/layers/modules/sign_up/pages/repeat_password_sign_up_page.dart';
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
import 'package:get/get.dart';
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
      name: Routes.ADDRESS_SIGN_UP,
      page: () => AddressSignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.PASSWORD_SIGN_UP,
      page: () => PasswordSignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.REPEAT_PASSWORD_SIGN_UP,
      page: () => RepeatPasswordSignUpPage(),
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

        name: Routes.EDIT_PROFILE,
        page: () => EditProfilePage(),
        binding: EditProfileBinding()),
    GetPage(
      name: Routes.SCHEDULE,
      page: () => SchedulePage(),
      binding: ScheduleBinding(),
    ),
    GetPage(
      name: Routes.ADD_SCHEDULE,
      page: () => AddSchedulePage(),
      binding: ScheduleBinding(),
    ),
    GetPage(
      name: Routes.COMPLAINTS,
      page: () => ComplaintsPage(),
      binding: ComplaintBinding(),
    ),
    GetPage(
      name: Routes.ADD_COMPLAINT,
      page: () => AddComplaintPage(),
      binding: ComplaintBinding(),
    ),
    GetPage(
      name: Routes.EQUIPMENT,
      page: () => EquipmentRequestPage(),
      binding: EquipmentBinding(),
    ),
    GetPage(
      name: Routes.EQUIPMENT_REQUEST,
      page: () => EquipmentRequestPage(),
      binding: EquipmentBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ABOUT,
      page: () => AboutPage(),
    ),
    GetPage(
      name: Routes.MENU,
      page: () => MenuPage(),
    )
  ];
}
