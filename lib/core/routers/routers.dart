// ignore_for_file: prefer_const_constructors
import 'package:easyflow/layers/modules/about/about_page.dart';
import 'package:easyflow/layers/modules/complaint/pages/complaints_page.dart';
import 'package:easyflow/layers/modules/daily/pages/add_daily_page.dart';
import 'package:easyflow/layers/modules/daily/pages/dailys_page.dart';
import 'package:easyflow/layers/modules/equipment/pages/equipments_page.dart';
import 'package:easyflow/layers/modules/equipment/pages/request_equipment_page.dart';
import 'package:easyflow/layers/modules/schedule/pages/schedule_page.dart';
import 'package:easyflow/layers/modules/complaint/pages/add_complaint_page.dart';
import 'package:easyflow/layers/modules/edit_profile/edit_profile_page.dart';
import 'package:easyflow/layers/modules/home/pages/home_page.dart';
import 'package:easyflow/layers/modules/sign_up/pages/password_sign_up_page.dart';
import 'package:easyflow/layers/modules/sign_up/pages/address_sign_up_page.dart';
import 'package:easyflow/layers/modules/menu/menu_page.dart';
import 'package:easyflow/layers/modules/sign_up/pages/repeat_password_sign_up_page.dart';
import 'package:easyflow/layers/modules/splash_screen/splash_screen_page.dart';
import 'package:easyflow/layers/modules/login/login_page.dart';
import 'package:easyflow/layers/modules/sign_up/pages/sign_up_page.dart';
import 'package:easyflow/layers/modules/sign_up/pages/success_sign_up_page.dart';
import 'package:easyflow/layers/modules/forgot_password/pages/email_forgot_password_page.dart';
import 'package:easyflow/layers/modules/forgot_password/pages/code_forgot_password_page.dart';
import 'package:easyflow/layers/modules/forgot_password/pages/new_password_forgot_password_page.dart';
import 'package:easyflow/layers/modules/forgot_password/pages/success_forgot_password_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routers = GoRouter(initialLocation: '/', routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) => SplashScreenPage(),
  ),
  GoRoute(
    path: '/login',
    builder: (BuildContext context, GoRouterState state) => LoginPage(),
  ),
  GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) => SignUpPage(),
      routes: <GoRoute>[
        GoRoute(
          path: 'address',
          builder: (BuildContext context, GoRouterState state) =>
              AddressSignUpPage(),
        ),
        GoRoute(
          path: 'password',
          builder: (BuildContext context, GoRouterState state) =>
              PasswordSignUpPage(),
        ),
        GoRoute(
          path: 'repeat_password',
          builder: (BuildContext context, GoRouterState state) =>
              RepeatPasswordSignUpPage(),
        ),
        GoRoute(
          path: 'success',
          builder: (BuildContext context, GoRouterState state) =>
              SuccessSignUpPage(),
        ),
      ]),
  GoRoute(
      path: '/forgot_password',
      builder: (BuildContext context, GoRouterState state) =>
          EmailForgotPasswordPage(),
      routes: <GoRoute>[
        GoRoute(
          path: 'code',
          builder: (BuildContext context, GoRouterState state) =>
              CodeForgotPasswordPage(),
        ),
        GoRoute(
          path: 'password/new',
          builder: (BuildContext context, GoRouterState state) =>
              NewPasswordForgotPasswordPage(),
        ),
        GoRoute(
          path: 'sucess',
          builder: (BuildContext context, GoRouterState state) =>
              SuccessForgotPasswordPage(),
        ),
      ]),
  GoRoute(
    path: '/home',
    builder: (BuildContext context, GoRouterState state) => HomePage(),
  ),
  GoRoute(
    path: '/menu',
    builder: (BuildContext context, GoRouterState state) => MenuPage(),
  ),
  GoRoute(
    path: '/profile/edit',
    builder: (BuildContext context, GoRouterState state) => EditProfilePage(),
  ),
  GoRoute(
    path: '/schedule',
    builder: (BuildContext context, GoRouterState state) => SchedulePage(),
  ),
  GoRoute(
      path: '/dailys',
      builder: (BuildContext context, GoRouterState state) => DailysPage(),
      routes: <GoRoute>[
        GoRoute(
          path: 'add',
          builder: (BuildContext context, GoRouterState state) =>
              AddDailyPage(),
        ),
      ]),
  GoRoute(
      path: '/complaints',
      builder: (BuildContext context, GoRouterState state) => ComplaintsPage(),
      routes: <GoRoute>[
        GoRoute(
          path: 'add',
          builder: (BuildContext context, GoRouterState state) =>
              AddComplaintPage(),
        ),
      ]),
  GoRoute(
      path: '/equipments',
      builder: (BuildContext context, GoRouterState state) => EquipmentsPage(),
      routes: <GoRoute>[
        GoRoute(
          path: 'request',
          builder: (BuildContext context, GoRouterState state) =>
              RequestEquipmentPage(),
            
        ),
      ]),
  GoRoute(
    path: '/about',
    builder: (BuildContext context, GoRouterState state) => AboutPage(),
  ),
]);
