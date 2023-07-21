import 'package:easyflow/core/utils/validators_util.dart';
import 'package:easyflow/layers/domain/entities/representative_entity.dart';
import 'package:easyflow/layers/presentation/controller/equipment_controller.dart';
import 'package:easyflow/layers/presentation/ui/widgets/calendar_day_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/button_text_field_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/listview/listview_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/modals_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/representative_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

class RequestEquipmentPage extends StatefulWidget {
  const RequestEquipmentPage({super.key});

  @override
  State<RequestEquipmentPage> createState() => _RequestEquipmentPageState();
}

class _RequestEquipmentPageState extends State<RequestEquipmentPage> {
  final formKey = GlobalKey<FormState>();

  Widget? _dayBuilder(BuildContext cxt, DateTime day, DateTime focusedDay) {
    return CalendarDayWidget(day: day, focusedDay: focusedDay);
  }

  final controller = GetIt.I.get<EquipmentController>();
  RepresentativeEntity? representative;

  selectRepresentative(RepresentativeEntity representative) {
    setState(() {
      representative = representative;
    });
    context.pop();
  }

  requestEquipment(context) {
    if (formKey.currentState!.validate()) {
      context.push('/equipments');
    }
  }

  var firstDay = DateTime.now();
  var lastDay = DateTime.utc(DateTime.now().year + 1);
  var requestDate = DateTime.now();
  var focusedDay = DateTime.now();

  var returnDate = DateTime.now();
  var returnDateFocusedDay = DateTime.now().add(const Duration(days: 1));
  var returnDateFirstDay = DateTime.now().add(const Duration(days: 1));

  var justificationTextFieldController = TextEditingController();

  void onRequestDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      requestDate = selectedDay;
      this.focusedDay = focusedDay;

      returnDateFocusedDay = requestDate.add(const Duration(days: 1));
      returnDateFirstDay = requestDate.add(const Duration(days: 1));
    });
  }

  void onReturnDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      returnDate = selectedDay;
      returnDateFocusedDay = focusedDay;
    });
  }

  String getMonth(int month) {
    var monthsOfTheYear = {
      1: "Janeiro",
      2: "Fevereiro",
      3: "Março",
      4: "Abril",
      5: "Maio",
      6: "Junho",
      7: "Julho",
      8: "Agosto",
      9: "Setembro",
      10: "Outubro",
      11: "Novembro",
      12: "Dezembro",
    };

    return monthsOfTheYear[month] ?? "Janeiro";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Solicitando",
        ),
      ),
      body: SafeArea(
          child: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
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
                      focusedDay: focusedDay,
                      firstDay: firstDay,
                      lastDay: lastDay,
                      calendarFormat: CalendarFormat.week,
                      daysOfWeekVisible: false,
                      rowHeight: 69,
                      onDaySelected: onRequestDaySelected,
                      selectedDayPredicate: (day) {
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
                          getMonth(day.month),
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
                      focusedDay: returnDateFocusedDay,
                      firstDay: returnDateFirstDay,
                      lastDay: lastDay,
                      calendarFormat: CalendarFormat.week,
                      daysOfWeekVisible: false,
                      rowHeight: 69,
                      onDaySelected: onReturnDaySelected,
                      selectedDayPredicate: (day) {
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
                          getMonth(day.month),
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
                    ButtonTextFieldWidget(
                      validator: (value) => Validators.isNotEmpty(value),
                      onTap: () => Modals.page(
                        context: context,
                        title: const Text('Selecione o representate'),
                        body: SafeArea(
                          child: ListViewWidget<RepresentativeEntity>(
                            searchFieldEnabled: true,
                            padding: const EdgeInsets.all(16),
                            asyncListFilter: (value, list) => list
                                .where(
                                  (element) => element.name
                                      .toLowerCase()
                                      .contains(value.toLowerCase()),
                                )
                                .toList(),
                            onRefresh: () => controller.getRepresentatives(),
                            asyncListCallback: () =>
                                controller.getRepresentatives(),
                            separatorBuilder: (p0, p1) => const SizedBox(
                              height: 16,
                            ),
                            builder: (representative) => RepresentativeWidget(
                              selected: representative.id == representative.id
                                  ? true
                                  : false,
                              representative: representative,
                              onTap: () {
                                setState(() {
                                  representative = representative;
                                  context.pop();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      label: 'Representante',
                      controller: TextEditingController(
                          text: representative?.name ?? ''),
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
                      controller: justificationTextFieldController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => Validators.isNotEmpty(value),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 50,
          margin: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () => requestEquipment(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              elevation: 0,
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text(
              "Solicitar",
            ),
          ),
        ),
      ])),
    );
  }
}
