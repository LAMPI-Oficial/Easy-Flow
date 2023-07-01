import 'package:easyflow/layers/modules/complaint/complaint_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ComplaintsPage extends GetView<ComplaintController> {
  const ComplaintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reclamações'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => context.push('/complaints/add'),
            child: const Icon(Icons.add)),
        body: SafeArea(child: Text('')));
  }
}
