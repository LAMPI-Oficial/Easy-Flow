import 'package:easyflow/layers/data/model/daily_model.dart';
import 'package:flutter/material.dart';

class DailyWidget extends StatelessWidget {
  final DailyModel daily;
  const DailyWidget({super.key, required this.daily});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Daily feito em ${daily.formattedData}'),
    );
  }
}
