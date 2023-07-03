import 'package:easyflow/layers/domain/entities/enums/status_enum.dart';
import 'package:easyflow/layers/domain/entities/equipment_entity.dart';
import 'package:flutter/material.dart';

class EquipmentWidget extends StatelessWidget {
  final void Function()? onTap;
  final EquipmentEntity equipment;
  const EquipmentWidget({super.key, required this.equipment, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      title: Text(
        "Solicitação efetuada em ${equipment.formattedData}",
        style: const TextStyle(
          fontFamily: "Segoe_UI",
          fontSize: 16,
          color: Color(0XFF4A6F90),
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Column(
        children: [
          if (equipment.status == Status.APPROVED)
            const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff69c05b),
                  radius: 5,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Aprovado',
                ),
              ],
            ),
          if (equipment.status == Status.PENDING)
            const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xffFFDB5E),
                  radius: 5,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Pendente',
                ),
              ],
            ),
          if (equipment.status == Status.DISAPPROVED)
            const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xffFF4C4C),
                  radius: 5,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Reprovado',
                ),
              ],
            ),
        ],
      ),
    );
  }
}
