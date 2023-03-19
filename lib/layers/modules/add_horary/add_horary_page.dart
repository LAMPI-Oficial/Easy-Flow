import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_horary_controller.dart';

class AddHoraryPage extends GetView<AddHoraryController> {
  const AddHoraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddHoraryController>(
      init: AddHoraryController(),
      initState: (_) {},
      builder: (_) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Horário'),
              ),
              body: SafeArea(
                child: Column(
                  children: [],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
