import 'package:easyflow/layers/domain/entities/daily_entity.dart';
import 'package:easyflow/layers/presentation/controller/daily_controller.dart';
import 'package:easyflow/layers/presentation/ui/widgets/daily_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/listview/listview_widget.dart';
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
        child: ListViewWidget<DailyEntity>(
          padding: const EdgeInsets.all(16),
          separatorBuilder: (p0, p1) => const SizedBox(
            height: 16,
          ),
          asyncListCallback: () => controller.getDailys(),
          builder: (DailyEntity daily) => DailyWidget(daily: daily),
        ),
      ),
    );
  }
}
