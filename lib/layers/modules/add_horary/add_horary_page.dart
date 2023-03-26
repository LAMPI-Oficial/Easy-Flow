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
    final medWidth = MediaQuery.of(context).size.width;

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
                      padding: EdgeInsets.symmetric(
                        vertical: medHeight * .02,
                        horizontal: medWidth * .05,
                      ),
                      child: Column(
                        children: [
                          AddDayWidget(
                            value: _.selectedSeg,
                            selected: _.turnSeg,
                            aux: 0,
                            title: "Segunda-feira",
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: medHeight * .02,
                            ),
                            child: AddDayWidget(
                              value: _.selectedTer,
                              selected: _.turnTer,
                              aux: 1,
                              title: "Terça-feira",
                            ),
                          ),
                          AddDayWidget(
                            value: _.selectedQua,
                            selected: _.turnQua,
                            aux: 2,
                            title: "Quarta-feira",
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: medHeight * .02,
                            ),
                            child: AddDayWidget(
                              value: _.selectedQui,
                              selected: _.turnQui,
                              aux: 3,
                              title: "Quinta-feira",
                            ),
                          ),
                          AddDayWidget(
                            value: _.selectedSex,
                            selected: _.turnSex,
                            aux: 4,
                            title: "Sexta-feira",
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: medHeight * .03,
                            ),
                            child: ChooseTableWidget(
                              selected: _.selectedTable,
                              title: "Selecione uma mesa",
                              subtitle:
                                  "a mesa selecionada é válida pelos\ndias selecionados",
                            ),
                          ),
                          SizedBox(
                            height: medHeight * .06,
                            width: medWidth,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Guardar",
                                style: TextStyle(
                                  fontFamily: "Segoe UI",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
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
