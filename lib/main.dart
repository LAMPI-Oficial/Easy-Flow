// ignore_for_file: depend_on_referenced_packages
import 'package:easyflow/core/inject/inject.dart';
import 'package:easyflow/core/routers/routers.dart';
import 'package:easyflow/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR');
  Inject.init();

  runApp(
    MaterialApp.router(
      title: 'EasyFlow',
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      routerDelegate: routers.routerDelegate,
      routeInformationParser: routers.routeInformationParser,
      routeInformationProvider: routers.routeInformationProvider,
    ),
  );
}
