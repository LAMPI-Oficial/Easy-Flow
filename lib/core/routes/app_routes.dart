// ignore_for_file: constant_identifier_names

part of './app_pages.dart';

abstract class Routes {
  static const SPLASH_SCREEN = '/';
  static const LOGIN = '/login';
  static const SIGN_UP = '/sign_up';
  static const SIGN_UP_PERSONAL = '/sign_up/personal';
  static const SIGN_UP_RESIDENTIAL = '/sign_up/residential';
  static const SIGN_UP_PASSWORD = '/sign_up/password';
  static const SIGN_UP_SUCCESS = '/sign_up/success';
  static const FORGOT_PASSWORD_EMAIL = '/forgot_password/email';
  static const FORGOT_PASSWORD_CODE = '/forgot_password/code';
  static const FORGOT_PASSWORD_NEW_PASSWORD = '/forgot_password/password/new';
  static const FORGOT_PASSWORD_SUCCESS = '/forgot_password/success';
}
