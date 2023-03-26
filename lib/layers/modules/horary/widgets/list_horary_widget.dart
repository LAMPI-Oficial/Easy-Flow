import 'package:easyflow/layers/data/model/horary_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListHoraryWidget extends StatelessWidget {
  final HoraryModel object;

  const ListHoraryWidget({
    super.key,
    required this.object,
  });

  static const textStyle = TextStyle(
    fontFamily: "Segoe UI",
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Color(0xff4A6F90),
  );

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat("00");

    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: Get.theme.colorScheme.primary,
                ),
                height: constraints.maxHeight,
                child: Center(
                  child: Text(
                    formatter.format(object.numTable),
                    style: const TextStyle(
                      fontFamily: "Segoe UI",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    object.name,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    object.day.substring(0, 3),
                    overflow: TextOverflow.ellipsis,
                    style: textStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    object.turn,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
