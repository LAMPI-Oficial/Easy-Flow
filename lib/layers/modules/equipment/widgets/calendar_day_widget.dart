import 'package:flutter/material.dart';

class CalendarDayWidget extends StatelessWidget {
  final DateTime day;
  final DateTime focusedDay;
  final Color boxColor;
  final Color textColor;

  const CalendarDayWidget({
    super.key,
    required this.day,
    required this.focusedDay,
    this.boxColor = Colors.white,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    String weekDay = getWeekDay(day.weekday).substring(0, 3);

    return Container(
      padding: const EdgeInsets.all(0),
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xffBBBBBB),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weekDay,
            style: TextStyle(
              fontFamily: "Segoe_UI",
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            day.day.toString(),
            style: TextStyle(
              fontFamily: "Segoe_UI",
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  String getWeekDay(int month) {
    var monthsOfTheYear = {
      1: "Segunda",
      2: "Terça",
      3: "Quarta",
      4: "Quinta",
      5: "Sexta",
      6: "Sábado",
      7: "Domingo",
    };

    return monthsOfTheYear[month] ?? "Janeiro";
  }
}
