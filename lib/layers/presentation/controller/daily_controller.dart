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

  addDaily(BuildContext context) {
    if (formKeyDaily.currentState!.validate()) {
      Dialogs.loading(context);
      try {
        _createDailyUseCase
            .call(
          DailyEntity(
            description: descriptionTextController.text,
            date: DateTime.now(),
          ),
        )
            .then((value) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });
      } on ApiException catch (e) {
        Navigator.of(context).pop();
        Dialogs.error(context, title: e.title, message: e.message);
      }
    }
  }

  Future<List<DailyEntity>> getDailys() async {
    return [DailyEntity(date: DateTime.now(), description: '')];
  }
}
