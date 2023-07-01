import 'package:easyflow/layers/modules/daily/daily_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDailyPage extends GetView<DailyController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('AddDailyPage')),

    body: SafeArea(
      child: Text('AddDailyController'))
    );
  }
}