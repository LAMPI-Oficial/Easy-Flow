import 'package:easyflow/core/utils/validators_util.dart';
import 'package:easyflow/layers/modules/equipment/equipment_controller.dart';
import 'package:easyflow/layers/modules/equipment/widgets/calendar_day_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class EquipmentRequestPage extends GetView<EquipmentController> {
  const EquipmentRequestPage({super.key});

  Widget? _dayBuilder(BuildContext cxt, DateTime day, DateTime focusedDay) {
    return CalendarDayWidget(day: day, focusedDay: focusedDay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Solicitando",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Obx(
                  () => Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Selecione a data de solicitação",
                          style: TextStyle(
                            fontFamily: "Segoe_UI",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        TableCalendar(
                          focusedDay: controller.focusedDay.value,
                          firstDay: controller.firstDay,
                          lastDay: controller.lastDay,
                          calendarFormat: CalendarFormat.week,
                          daysOfWeekVisible: false,
                          rowHeight: 69,
                          onDaySelected: controller.onRequestDaySelected,
                          selectedDayPredicate: (day) {
                            var requestDate = controller.requestDate.value;
                            return isSameDay(requestDate, day);
                          },
                          headerStyle: const HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                          ),
                          calendarBuilders: CalendarBuilders(
                            outsideBuilder: _dayBuilder,
                            todayBuilder: _dayBuilder,
                            defaultBuilder: _dayBuilder,
                            selectedBuilder: (context, day, focusedDay) {
                              return CalendarDayWidget(
                                day: day,
                                focusedDay: focusedDay,
                                boxColor: Colors.blue,
                                textColor: Colors.white,
                              );
                            },
                            headerTitleBuilder: (context, day) => Text(
                              controller.getMonth(day.month),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: "Segoe_UI",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "Selecione a data de entrega",
                            style: TextStyle(
                              fontFamily: "Segoe_UI",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        TableCalendar(
                          focusedDay: controller.returnDateFocusedDay.value,
                          firstDay: controller.returnDateFirstDay.value,
                          lastDay: controller.lastDay,
                          calendarFormat: CalendarFormat.week,
                          daysOfWeekVisible: false,
                          rowHeight: 69,
                          onDaySelected: controller.onReturnDaySelected,
                          selectedDayPredicate: (day) {
                            var returnDate = controller.returnDate.value;
                            return isSameDay(returnDate, day);
                          },
                          headerStyle: const HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                          ),
                          calendarBuilders: CalendarBuilders(
                            outsideBuilder: _dayBuilder,
                            todayBuilder: _dayBuilder,
                            defaultBuilder: _dayBuilder,
                            selectedBuilder: (context, day, focusedDay) {
                              return CalendarDayWidget(
                                day: day,
                                focusedDay: focusedDay,
                                boxColor: Colors.blue,
                                textColor: Colors.white,
                              );
                            },
                            headerTitleBuilder: (context, day) => Text(
                              controller.getMonth(day.month),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: "Segoe_UI",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Representante",
                                  style: TextStyle(
                                    fontFamily: "Segoe_UI",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              DropdownButtonFormField<String>(
                                onChanged: controller.onDropdownValueChanged,
                                value: controller.representative,
                                items: controller.representatives
                                    .map<DropdownMenuItem<String>>(
                                        (representante) {
                                  return DropdownMenuItem(
                                    value: representante,
                                    child: Text(
                                      representante,
                                      style: const TextStyle(
                                        fontFamily: "Segoe_UI",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                borderRadius: BorderRadius.circular(10),
                                dropdownColor: Colors.white,
                                isExpanded: true,
                                decoration: InputDecoration(
                                  hintStyle: const TextStyle(
                                    fontFamily: "Segoe_UI",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fillColor: Colors.white,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Justificativa",
                                  style: TextStyle(
                                    fontFamily: "Segoe_UI",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const Text(
                                "Escreva uma justificativa para a solicitação do notebook",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextFormField(
                                minLines: 4,
                                maxLines: 4,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fillColor: Colors.white,
                                ),
                                controller:
                                    controller.justificationTextFieldController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) =>
                                    Validators.isNotEmpty(value),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    elevation: 0,
                                    minimumSize:
                                        const Size(double.infinity, 40),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: const Text(
                                    "Finalizar solicitação",
                                    style: TextStyle(
                                      fontFamily: "Segoe_UI",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
