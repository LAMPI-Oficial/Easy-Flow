import 'package:easyflow/layers/modules/home/controller/repre_controller.dart';
import 'package:easyflow/layers/modules/home/model/representatives_model.dart';
import 'package:easyflow/layers/widgets/tite_representative.dart';
import 'package:flutter/material.dart';

class PageRepresentatives extends StatelessWidget {
  PageRepresentatives({super.key});

  final List<RepresentativesModel> representatives =
      HomeController().representatives;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      child: ListView.builder(
        itemCount: representatives.length,
        itemBuilder: (context, index) {
          return TileRepresentativeWidget(
            representative: representatives[index],
          );
        },
      ),
    );
  }
}
