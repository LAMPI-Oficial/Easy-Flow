import 'package:easyflow/core/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../adm_equipments_controller.dart';

class RequestsPage extends GetView<AdmEquipmentsController> {
  const RequestsPage({super.key});

  final green = const Color(0xff69c05b);
  final yellow = const Color(0xffFFDB5E);
  final red = const Color(0xffFF4C4C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Dismissible(
          key: const ValueKey('AppBar'),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              Navigator.of(context).pop();
            }
          },
          child: const Text(
            "Solicitações",
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
        child: ListView.builder(
          itemCount: controller.requests.length,
          itemBuilder: (context, index) {
            final String status = controller.requests[index];

            return ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Solicitação efetuada em 04 de Janeiro de 2023",
                    style: TextStyle(
                      fontFamily: "Segoe_UI",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff4A6F90),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: CircleAvatar(
                          backgroundColor: _getDropColorByStatus(status),
                          radius: 4,
                        ),
                      ),
                      Text(
                        status,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8B8B8B),
                        ),
                      ).marginSymmetric(vertical: 5),
                    ],
                  ),
                  if (status == 'Pendente')
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xff8B8B8B),
                        ),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset('assets/images/file_open.png'),
                            const Text(
                              "Verificar solicitação",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Color(0xff8B8B8B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ).marginSymmetric(vertical: 5);
          },
        ).marginSymmetric(horizontal: 20),
      ),
    );
  }

  Color _getDropColorByStatus(String status) {
    switch (status) {
      case "Verificado":
        return green;
      case "Pendente":
        return yellow;
      default:
        return red;
    }
  }
}
