import 'package:easyflow/layers/modules/horary/horary_controller.dart';
import 'package:easyflow/layers/modules/widgets/add_day_widget.dart';
import 'package:easyflow/layers/modules/widgets/choose_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHoraryPage extends GetView<HoraryController> {
  const AddHoraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Horário'),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      AddDayWidget(
                        value: controller.selectedSeg,
                        selected: controller.turnSeg,
                        aux: 0,
                        title: "Segunda-feira",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AddDayWidget(
                        value: controller.selectedTer,
                        selected: controller.turnTer,
                        aux: 1,
                        title: "Terça-feira",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AddDayWidget(
                        value: controller.selectedQua,
                        selected: controller.turnQua,
                        aux: 2,
                        title: "Quarta-feira",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AddDayWidget(
                        value: controller.selectedQui,
                        selected: controller.turnQui,
                        aux: 3,
                        title: "Quinta-feira",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AddDayWidget(
                        value: controller.selectedSex,
                        selected: controller.turnSex,
                        aux: 4,
                        title: "Sexta-feira",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ChooseTableWidget(
                        selected: controller.selectedTable,
                        title: "Selecione uma mesa",
                        subtitle:
                            "a mesa selecionada é válida pelos\ndias selecionados",
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Salvar",
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
