import 'package:easyflow/layers/modules/home/controller/home_controller.dart';
import 'package:easyflow/layers/modules/home/model/representatives_model.dart';
import 'package:easyflow/layers/modules/home/widgets/tite_representative.dart';
import 'package:flutter/material.dart';

class PageRepresentatives extends StatelessWidget {
  final List<RepresentativesModel> representatives;
  PageRepresentatives({super.key, required this.representatives});

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
