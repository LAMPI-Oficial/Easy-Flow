import 'package:easyflow/layers/domain/entities/complaint_entity.dart';
import 'package:flutter/material.dart';

class ComplaintWidget extends StatelessWidget {
  final void Function()? onTap;
  final ComplaintEntity complaint;
  const ComplaintWidget({super.key, required this.complaint, this.onTap});

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
        'Reclamação feita em ${complaint.formattedData}',
        style: const TextStyle(
          color: Color(0xFF4A6F90),
        ),
      ),
      trailing: Container(
        height: 25,
        width: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Text('abrir',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
      ),
    );
  }
}
