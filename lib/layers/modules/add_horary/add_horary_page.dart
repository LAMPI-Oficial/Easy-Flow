import 'package:easyflow/layers/modules/add_horary/widgets/add_day_widget.dart';
// import 'package:flutter/cupertino.dart';
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
                child: Center(
                  child: Column(
                    children: [
                      AddDayWidget(
                        selected: _.selectedSeg,
                        aux: 0,
                        title: "Segunda-feira",
                      ),
                      AddDayWidget(
                        selected: _.selectedTer,
                        aux: 1,
                        title: "Terça-feira",
                      ),
                      AddDayWidget(
                        selected: _.selectedQua,
                        aux: 2,
                        title: "Quarta-feira",
                      ),
                      AddDayWidget(
                        selected: _.selectedQui,
                        aux: 3,
                        title: "Quinta-feira",
                      ),
                      AddDayWidget(
                        selected: _.selectedSex,
                        aux: 4,
                        title: "Sexta-feira",
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
