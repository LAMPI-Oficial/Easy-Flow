import 'package:easyflow/core/routes/app_pages.dart';
import 'package:easyflow/layers/modules/horary/widgets/dropbutton_widget.dart';
import 'package:easyflow/layers/modules/horary/widgets/list_horary_widget.dart';
import 'package:easyflow/layers/modules/horary/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'horary_controller.dart';

class HoraryPage extends GetView<HoraryController> {
  const HoraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horário'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_HORARY),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: context.width * .90,
            height: context.height,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: context.height * .01,
                  ),
                  child: SizedBox(
                    height: context.height * .05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const TextWidget(
                          flex: 1,
                          title: "Mesa",
                        ),
                        const TextWidget(
                          flex: 3,
                          title: "Nome",
                        ),
                        Obx(
                          () => DropButtonWidget(
                            flex: 2,
                            hint: "Dia",
                            value: controller.valueDay.value,
                            items: controller.valuesDays.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value.substring(0, 3)),
                              );
                            }).toList(),
                            onChanged: (value) =>
                                controller.changeValueDay(value!),
                          ),
                        ),
                        Obx(
                          () => DropButtonWidget(
                            flex: 2,
                            hint: "Turno",
                            value: controller.valueTurn.value,
                            items: controller.valuesTurns.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.changeValueTurn(value!);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * .80,
                  child: ListView.separated(
                    itemCount: controller.objects.length,
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 3),
                      );
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        height: context.height * .05,
                        child: ListHoraryWidget(
                          object: controller.objects[index],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
