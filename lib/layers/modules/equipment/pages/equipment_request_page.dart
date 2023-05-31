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
          "Solicitação",
        ),
      ),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Expanded(
                child: Obx(
                  () => Container(
                    margin: const EdgeInsets.all(20),
                    child: ListView(
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
                        const SizedBox(
                          height: 32,
                        ),
                        Obx(
                          () => DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              label: Text('Representante'),
                            ),
                            items:
                                controller.representatives.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              controller.representative.value = value!;
                            },
                            validator: (value) => Validators.combine(
                              [
                                () => Validators.isNotSelected(value),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          minLines: 4,
                          maxLines: 10,
                          decoration: const InputDecoration(
                            label: Text('Justificativa'),
                            hintText:
                                'Escreva uma justificativa para a solicitação do notebook',
                          ),
                          controller:
                              controller.justificationTextFieldController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => Validators.isNotEmpty(value),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () => controller.requestEquipment(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    "Finalizar solicitar",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
