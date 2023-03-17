import 'package:easyflow/layers/modules/equipment/equiment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class EquipmentRequestPage extends GetView<EquipmentController> {
  const EquipmentRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text("data"),
                  TableCalendar(
                    focusedDay: controller.focusedDay,
                    firstDay: controller.firstDay,
                    lastDay: controller.lastDay,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
