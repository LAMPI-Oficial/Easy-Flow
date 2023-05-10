import 'package:easyflow/core/routes/app_pages.dart';
import 'package:easyflow/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.initialRoute,
    theme: appThemeData,
    getPages: AppPages.pages,
  ),);
}
