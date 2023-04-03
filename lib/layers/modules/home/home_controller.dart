import 'package:easyflow/layers/data/model/representatives_model.dart';
import 'package:easyflow/layers/data/provider/data_representative.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var controllerTextFormField = TextEditingController();
  late TabController controllerTab;
  final RxList<RepresentativesModel> _reprePesquisar =
      RxList<RepresentativesModel>();

  @override
  void onInit() {
    super.onInit();
    controllerTextFormField.addListener(() {
      pesquisar();
    });
    _reprePesquisar.value = representativesData;

    controllerTab = TabController(vsync: this, length: 2);
  }

  @override
  void onClose() {
    controllerTab.dispose();
    super.onClose();
  }

  pesquisar() {
    _reprePesquisar.value = representativesData;
    if (controllerTextFormField.text != "") {
      _reprePesquisar.value = representativesData
          .where((element) => element.name
              .toLowerCase()
              .contains(controllerTextFormField.value.text.toLowerCase()))
          .toList();
    } else {
      _reprePesquisar.value = representativesData;
    }

    update();
  }

  get representatives {
    return _reprePesquisar;
  }

  get textEmpty => controllerTextFormField.text == "";
}
