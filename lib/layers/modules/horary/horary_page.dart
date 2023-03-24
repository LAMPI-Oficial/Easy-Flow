import 'package:easyflow/layers/modules/horary/widgets/list_horary_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'horary_controller.dart';
import 'widgets/dropbutton_widget.dart';

class HoraryPage extends GetView<HoraryController> {
  const HoraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HoraryController>(
      init: HoraryController(),
      initState: (_) {},
      builder: (_) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Horário'),
                actions: [
                  GetPlatform.isIOS
                      ? FloatingActionButton(
                          elevation: 0,
                          onPressed: () {},
                          child: const Icon(Icons.add),
                        )
                      : Container(),
                ],
              ),
              floatingActionButton: !GetPlatform.isIOS
                  ? FloatingActionButton(
                      elevation: 0,
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    )
                  : Container(),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          height: 40,
                          child: Row(
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
                                    value: _.valueDay,
                                    items: _.valuesDays.map((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) =>
                                        _.changeValueDay(value),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: DropButtonWidget(
                                    hint: "Turno",
                                    value: _.valueTurn,
                                    items: _.valuesTurns.map((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) =>
                                        _.changeValueTurn(value),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
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
