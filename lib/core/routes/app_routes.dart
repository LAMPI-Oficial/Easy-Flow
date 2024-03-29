// ignore_for_file: constant_identifier_names

part of './app_pages.dart';

abstract class Routes {
  static const SPLASH_SCREEN = '/';
  static const LOGIN = '/login';
  static const SIGN_UP = '/sign_up';
  static const ADDRESS_SIGN_UP = '/sign_up/address';
  static const PASSWORD_SIGN_UP = '/sign_up/password';
  static const REPEAT_PASSWORD_SIGN_UP = '/sign_up/repeat_password';
  static const SIGN_UP_SUCCESS = '/sign_up/success';
  static const FORGOT_PASSWORD_EMAIL = '/forgot_password/email';
  static const FORGOT_PASSWORD_SUCCESS = '/forgot_password/success';
  static const EDIT_PROFILE = '/profile/edit';
  static const HOME = "/home";
  static const MENU = '/menu';
  static const SCHEDULE = '/schedule';
  static const ADD_SCHEDULE = '/schedule/add';
  static const EQUIPMENT_REQUESTS = '/equipment/requests';
  static const EQUIPMENT_REQUEST = '/equipment/request';
  static const DAILY = '/daily';
  static const ADD_DAILY = '/daily/add';
  static const COMPLAINTS = '/complaints';
  static const ADD_COMPLAINT = '/complaint/add';
  static const ABOUT = '/about';
}
