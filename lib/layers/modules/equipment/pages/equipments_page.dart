import 'package:easyflow/layers/modules/equipment/equipment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EquipmentPage extends GetView<EquipmentController> {
  const EquipmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SingleChildScrollView()),
    );
  }
}
