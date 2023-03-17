import 'package:easyflow/layers/modules/equipment/equipment_controller.dart';
import 'package:easyflow/layers/modules/equipment/widgets/calendar_day_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class EquipmentRequestPage extends GetView<EquipmentController> {
  const EquipmentRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Column(
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
                        todayBuilder: (context, day, focusedDay) =>
                            CalendarDayWidget(day: day, focusedDay: focusedDay),
                        defaultBuilder: (context, day, focusedDay) =>
                            CalendarDayWidget(day: day, focusedDay: focusedDay),
                        selectedBuilder: (context, day, focusedDay) =>
                            CalendarDayWidget(
                          day: day,
                          focusedDay: focusedDay,
                          boxColor: Colors.blue,
                          textColor: Colors.white,
                        ),
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
                    const Text(
                      "Selecione a data de entrega",
                      style: TextStyle(
                        fontFamily: "Segoe_UI",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
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
                        todayBuilder: (context, day, focusedDay) =>
                            CalendarDayWidget(day: day, focusedDay: focusedDay),
                        defaultBuilder: (context, day, focusedDay) =>
                            CalendarDayWidget(day: day, focusedDay: focusedDay),
                        selectedBuilder: (context, day, focusedDay) =>
                            CalendarDayWidget(
                          day: day,
                          focusedDay: focusedDay,
                          boxColor: Colors.blue,
                          textColor: Colors.white,
                        ),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
