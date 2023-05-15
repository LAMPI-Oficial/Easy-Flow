import 'package:easyflow/core/routes/app_pages.dart';
import 'package:easyflow/layers/modules/equipment/equipment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EquipmentRequestsPage extends GetView<EquipmentController> {
  const EquipmentRequestsPage({super.key});

  final green = const Color(0xff69c05b);
  final yellow = const Color(0xffFFDB5E);
  final red = const Color(0xffFF4C4C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Dismissible(
          key: const ValueKey('AppBar'),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              Navigator.of(context).pop();
            }
          },
          child: const Text(
            "Equipamentos Solicitados",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _requestStatusWidget(
                    context,
                    status: "Aprovado",
                    details: "Ir no laboratório retirar notebook",
                    dropColor: green,
                  ),
                  _requestStatusWidget(
                    context,
                    status: "Pendente",
                    details: "Aguardando verificação da solicitação",
                    dropColor: yellow,
                  ),
                  _requestStatusWidget(
                    context,
                    status: "Reprovado",
                    details: "Sua justificativa não foi suficiente",
                    dropColor: red,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.requests.length,
                itemBuilder: (context, index) {
                  final String status = controller.requests[index];

                  return InkWell(
                    onTap: () {},
                    splashColor: Colors.blue,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 5,
                      ),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Solicitação efetuada em 04 de Janeiro de 2023",
                            style: TextStyle(
                              fontFamily: "Segoe_UI",
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: CircleAvatar(
                                  backgroundColor:
                                      _getDropColorByStatus(status),
                                  radius: 4,
                                ),
                              ),
                              Text(
                                status,
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(Routes.EQUIPMENT_REQUEST),
        child: const Icon(Icons.add),
      ),
    );
  }

  Color _getDropColorByStatus(String status) {
    switch (status) {
      case "Aprovado":
        return green;
      case "Pendente":
        return yellow;
      default:
        return red;
    }
  }

  Widget _requestStatusWidget(
    BuildContext context, {
    required String status,
    required String details,
    required Color dropColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: CircleAvatar(
                backgroundColor: dropColor,
                radius: 4,
              ),
            ),
            Text(
              status,
              style: const TextStyle(
                fontFamily: "Segoe_UI",
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.27,
          child: Text(
            details,
            style: const TextStyle(
              fontFamily: "Segoe_UI",
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xff8B8B8B),
            ),
          ),
        ),
      ],
    );
  }
}
