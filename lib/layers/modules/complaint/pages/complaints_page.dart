import 'package:easyflow/core/routes/app_pages.dart';
import 'package:easyflow/layers/modules/complaint/complaint_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplaintsPage extends GetView<ComplaintController> {
  const ComplaintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reclamações'),
          actions: [
            GetPlatform.isIOS
                ? IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(Routes.ADD_COMPLAINT),
                    icon: const Icon(Icons.add))
                : Container()
          ],
        ),
        floatingActionButton: !GetPlatform.isIOS
            ? FloatingActionButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.ADD_COMPLAINT),
                child: const Icon(Icons.add))
            : Container(),
        body: SafeArea(child: Text('')));
  }
}
