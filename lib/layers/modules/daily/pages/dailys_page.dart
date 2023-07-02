import 'package:easyflow/layers/data/model/daily_model.dart';
import 'package:easyflow/layers/modules/daily/daily_controller.dart';
import 'package:easyflow/layers/modules/daily/widgets/daily_widget.dart';
import 'package:easyflow/layers/widgets/listview/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class DailysPage extends StatelessWidget {
  const DailysPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<DailyController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Dailys')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/menu/dailys/add'),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListViewWidget<DailyModel>(
          padding: const EdgeInsets.all(16),
          separatorBuilder: (p0, p1) => const SizedBox(
            height: 16,
          ),
          asyncListCallback: () => controller.getDailys(),
          builder: (DailyModel daily) => DailyWidget(daily: daily),
        ),
      ),
    );
  }
}
