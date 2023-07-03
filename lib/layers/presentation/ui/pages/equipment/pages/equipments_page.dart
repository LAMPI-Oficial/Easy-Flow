import 'package:easyflow/layers/domain/entities/equipment_entity.dart';
import 'package:easyflow/layers/presentation/ui/pages/equipment/equipment_controller.dart';
import 'package:easyflow/layers/presentation/ui/pages/equipment/widgets/equipment_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/listview/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class EquipmentsPage extends StatelessWidget {
  const EquipmentsPage({super.key});

  final green = const Color(0xff69c05b);
  final yellow = const Color(0xffFFDB5E);
  final red = const Color(0xffFF4C4C);

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<EquipmentController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Equipamentos",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
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
              child: ListViewWidget<EquipmentEntity>(
                padding: const EdgeInsets.all(16),
                onRefresh: () => controller.getEquipments(),
                asyncListCallback: () => controller.getEquipments(),
                separatorBuilder: (p0, p1) => const SizedBox(
                  height: 16,
                ),
                builder: (EquipmentEntity equipment) =>
                    EquipmentWidget(equipment: equipment),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/menu/equipments/request'),
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
