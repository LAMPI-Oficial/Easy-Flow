import 'package:easyflow/layers/modules/horary/horary_controller.dart';
import 'package:easyflow/layers/modules/widgets/add_day_widget.dart';
import 'package:easyflow/layers/modules/widgets/choose_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHoraryPage extends GetView<HoraryController> {
  const AddHoraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final medHeight = MediaQuery.of(context).size.height;
    final medWidth = MediaQuery.of(context).size.width;

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
                        value: controller.selectedSeg,
                        selected: controller.turnSeg,
                        aux: 0,
                        title: "Segunda-feira",
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: medHeight * .02,
                        ),
                        child: AddDayWidget(
                          value: controller.selectedTer,
                          selected: controller.turnTer,
                          aux: 1,
                          title: "Terça-feira",
                        ),
                      ),
                      AddDayWidget(
                        value: controller.selectedQua,
                        selected: controller.turnQua,
                        aux: 2,
                        title: "Quarta-feira",
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: medHeight * .02,
                        ),
                        child: AddDayWidget(
                          value: controller.selectedQui,
                          selected: controller.turnQui,
                          aux: 3,
                          title: "Quinta-feira",
                        ),
                      ),
                      AddDayWidget(
                        value: controller.selectedSex,
                        selected: controller.turnSex,
                        aux: 4,
                        title: "Sexta-feira",
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: medHeight * .03,
                        ),
                        child: ChooseTableWidget(
                          selected: controller.selectedTable,
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
  }
}
