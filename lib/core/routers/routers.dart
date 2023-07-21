// ignore_for_file: prefer_const_constructors
import 'package:easyflow/layers/presentation/ui/pages/about/about_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/complaint/complaints_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/daily/add_daily_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/daily/dailys_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/equipment/equipments_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/equipment/request_equipment_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/error/error_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/schedule/schedule_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/complaint/add_complaint_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/profile/edit_profile_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/home/home_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/sign_up/password_sign_up_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/sign_up/address_sign_up_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/menu/menu_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/sign_up/repeat_password_sign_up_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/splash_screen/splash_screen_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/login/login_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/sign_up/sign_up_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/sign_up/success_sign_up_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/forgot_password/email_forgot_password_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/forgot_password/code_forgot_password_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/forgot_password/new_password_forgot_password_page.dart';
import 'package:easyflow/layers/presentation/ui/pages/forgot_password/success_forgot_password_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routers = GoRouter(
    initialLocation: '/home',
    errorBuilder: (BuildContext context, GoRouterState state) => ErrorPage(),
    routes: <GoRoute>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              SplashScreenPage(),
          routes: [
            GoRoute(
              path: 'login',
              builder: (BuildContext context, GoRouterState state) =>
                  LoginPage(),
            ),
            GoRoute(
                path: 'signup',
                builder: (BuildContext context, GoRouterState state) =>
                    SignUpPage(),
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
                path: 'forgot_password',
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
              path: 'home',
              builder: (BuildContext context, GoRouterState state) =>
                  HomePage(),
            ),
            GoRoute(
                path: 'menu',
                builder: (BuildContext context, GoRouterState state) =>
                    MenuPage(),
                routes: [
                  GoRoute(
                    path: 'profile/edit',
                    builder: (BuildContext context, GoRouterState state) =>
                        EditProfilePage(),
                  ),
                  GoRoute(
                    path: 'schedule',
                    builder: (BuildContext context, GoRouterState state) =>
                        SchedulePage(),
                  ),
                  GoRoute(
                      path: 'dailys',
                      builder: (BuildContext context, GoRouterState state) =>
                          DailysPage(),
                      routes: <GoRoute>[
                        GoRoute(
                          path: 'add',
                          builder:
                              (BuildContext context, GoRouterState state) =>
                                  AddDailyPage(),
                        ),
                      ]),
                  GoRoute(
                      path: 'complaints',
                      builder: (BuildContext context, GoRouterState state) =>
                          ComplaintsPage(),
                      routes: <GoRoute>[
                        GoRoute(
                          path: 'add',
                          builder:
                              (BuildContext context, GoRouterState state) =>
                                  AddComplaintPage(),
                        ),
                      ]),
                  GoRoute(
                      path: 'equipments',
                      builder: (BuildContext context, GoRouterState state) =>
                          EquipmentsPage(),
                      routes: <GoRoute>[
                        GoRoute(
                          path: 'request',
                          builder:
                              (BuildContext context, GoRouterState state) =>
                                  RequestEquipmentPage(),
                        ),
                      ]),
                  GoRoute(
                    path: 'about',
                    builder: (BuildContext context, GoRouterState state) =>
                        AboutPage(),
                  ),
                ]),
          ]),
    ]);
