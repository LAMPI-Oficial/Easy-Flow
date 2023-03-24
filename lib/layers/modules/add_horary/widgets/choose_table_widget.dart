import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../add_horary_controller.dart';

class ChooseTableWidget extends GetView<AddHoraryController> {
  final int selected;
  final String title;
  final String subtitle;

  const ChooseTableWidget({
    required this.selected,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final medHeight = MediaQuery.of(context).size.height;
    final medWidth = MediaQuery.of(context).size.width;

    final NumberFormat formatter = NumberFormat("00");

    return GetBuilder<AddHoraryController>(
      init: AddHoraryController(),
      initState: (_) {},
      builder: (_) {
        return Container(
          width: medWidth * .90,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: medHeight * .02,
                horizontal: medWidth * .04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff323232),
                    ),
                  ),
                  Text(
                    subtitle,
                    maxLines: 2,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8B8B8B),
                    ),
                  ),
                  Divider(height: medHeight * .04),
                  SizedBox(
                    height: medHeight * .34,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 21,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: medHeight * .04,
                        crossAxisSpacing: medWidth * .03,
                        mainAxisSpacing: medHeight * .01,
                      ),
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () => _.selectTable(index),
                          style: TextButton.styleFrom(
                            backgroundColor: selected == index
                                ? Get.theme.colorScheme.primary
                                : const Color(0xffD9D9D9),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            formatter.format(index + 1),
                            style: TextStyle(
                              fontFamily: "Segoe UI",
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: selected == index
                                  ? Colors.white
                                  : const Color(0xff323232),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
