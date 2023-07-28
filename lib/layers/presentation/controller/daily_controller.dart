import 'dart:math';

import 'package:easyflow/layers/domain/entities/daily_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:easyflow/layers/domain/usecases/create_daily_usecase.dart';
import 'package:easyflow/layers/presentation/ui/widgets/dialogs_widget.dart';
import 'package:flutter/material.dart';

class DailyController {
  final CreateDailyUseCase _createDailyUseCase;

  DailyController(this._createDailyUseCase);

  final formKeyDaily = GlobalKey<FormState>();
  final descriptionTextController = TextEditingController();

  Future<List<DailyEntity>> getDailys() async {
    return [DailyEntity(id: 1, date: DateTime.now(), description: '')];
  }
}
