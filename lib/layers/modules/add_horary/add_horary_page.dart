import 'package:easyflow/layers/modules/add_horary/widgets/add_day_widget.dart';
import 'package:easyflow/layers/modules/add_horary/widgets/choose_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_horary_controller.dart';

class AddHoraryPage extends GetView<AddHoraryController> {
  const AddHoraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final medHeight = MediaQuery.of(context).size.height;
    // final medWidth = MediaQuery.of(context).size.width;

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
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                      ),
                      child: Column(
                        children: [
                          AddDayWidget(
                            selected: _.selectedSeg,
                            aux: 0,
                            title: "Segunda-feira",
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: medHeight * .02,
                            ),
                            child: AddDayWidget(
                              selected: _.selectedTer,
                              aux: 1,
                              title: "Terça-feira",
                            ),
                          ),
                          AddDayWidget(
                            selected: _.selectedQua,
                            aux: 2,
                            title: "Quarta-feira",
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: medHeight * .02,
                            ),
                            child: AddDayWidget(
                              selected: _.selectedQui,
                              aux: 3,
                              title: "Quinta-feira",
                            ),
                          ),
                          AddDayWidget(
                            selected: _.selectedSex,
                            aux: 4,
                            title: "Sexta-feira",
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: medHeight * .03,
                            ),
                            child: const ChooseTableWidget(
                              title: "Selecione uma mesa",
                              subtitle:
                                  "a mesa selecionada é válida pelos\ndias selecionados",
                            ),
                          )
                        ],
                      ),
                    ),
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
