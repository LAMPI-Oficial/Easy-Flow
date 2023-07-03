import 'package:easyflow/layers/domain/entities/complaint_model.dart';
import 'package:easyflow/layers/presentation/controller/complaint_controller.dart';
import 'package:easyflow/layers/presentation/ui/widgets/complaint_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/listview/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ComplaintsPage extends StatelessWidget{
  const ComplaintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ComplaintController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reclamações'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => context.push('/menu/complaints/add'),
            child: const Icon(Icons.add)),
        body: SafeArea(child: SafeArea(
        child: ListViewWidget<ComplaintModel>(
          padding: const EdgeInsets.all(16),
          separatorBuilder: (p0, p1) => const SizedBox(
            height: 16,
          ),
          asyncListCallback: () => controller.getComplaints(),
          builder: (ComplaintModel daily) => ComplaintWidget(daily: daily),
        ),
      ),));
  }
}
