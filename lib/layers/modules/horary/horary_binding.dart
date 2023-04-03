import 'package:easyflow/layers/data/provider/horary_provider.dart';
import 'package:easyflow/layers/modules/horary/horary_controller.dart';
import 'package:easyflow/layers/data/repository/horary_repository.dart';
import 'package:get/get.dart';

class HoraryBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HoraryController>(() => HoraryController(
     HoraryRepository(HoraryProvider())));
  }
}