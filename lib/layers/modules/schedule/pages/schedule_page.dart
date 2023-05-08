import 'package:easyflow/core/routes/app_pages.dart';
import 'package:easyflow/layers/modules/schedule/widgets/list_horary_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../schedule_controller.dart';
import '../widgets/dropbutton_widget.dart';

class SchedulePage extends GetView<ScheduleController> {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Horário'),
            actions: [
              !GetPlatform.isAndroid
                  ? IconButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(Routes.ADD_SCHEDULE),
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                    )
                  : Container()
            ],
          ),
          floatingActionButton: GetPlatform.isAndroid
              ? FloatingActionButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Routes.ADD_SCHEDULE),
                  child: const Icon(Icons.add),
                )
              : Container(),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text(
                        "Mesa",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xff4A6F90),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 3,
                      child: Text(
                        "Nome",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xff4A6F90),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: DropButtonWidget(
                          hint: "Dia",
                          value: controller.valueDay,
                          items: controller.valuesDays.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) =>
                              controller.changeValueDay(value),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: DropButtonWidget(
                          hint: "Turno",
                          value: controller.valueTurn,
                          items: controller.valuesTurns.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) =>
                              controller.changeValueTurn(value),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * .80,
                  child: ListView.separated(
                    itemCount: 15,
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
                        height: constraints.maxHeight * .05,
                        child: const ListHoraryWidget(
                          numTable: "06",
                          name: "Larissa Silva",
                          day: "Seg",
                          turn: "Manhã",
                        ),
                      );
                    },
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
