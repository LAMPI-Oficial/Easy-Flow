import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'listing_horary_controller.dart';

class ListingHoraryPage extends GetView<ListingHoraryController> {
  const ListingHoraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Listagem de Horários'),
          ),
          body: const SafeArea(
            child: Text('Listagem de Horários'),
          ),
        );
      },
    );
  }
}
