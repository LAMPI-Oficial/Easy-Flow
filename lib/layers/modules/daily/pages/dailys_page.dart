import 'package:easyflow/layers/data/model/daily_model.dart';
import 'package:easyflow/layers/modules/daily/daily_controller.dart';
import 'package:easyflow/layers/modules/daily/widgets/daily_widget.dart';
import 'package:easyflow/layers/widgets/listview/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class DailysPage extends GetView<DailyController> {
  const DailysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dailys')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/dailys/add'),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListViewWidget<DailyModel>(
          asyncListCallback: () => controller.getAll(),
          builder: (DailyModel daily) => DailyWidget(daily: daily),
        ),
      ),
    );
  }
}
