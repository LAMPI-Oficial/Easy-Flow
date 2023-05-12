import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../daily_controller.dart';

class DailysPage extends GetView<DailyController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('DailysPage')),

    body: SafeArea(
      child: Text('DailysController'))
    );
  }
}