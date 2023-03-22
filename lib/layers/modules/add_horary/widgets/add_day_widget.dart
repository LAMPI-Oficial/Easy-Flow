import 'package:easyflow/layers/modules/add_horary/add_horary_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDayWidget extends GetView<AddHoraryController> {
  final int selected;
  final int aux;
  final String title;

  const AddDayWidget({
    super.key,
    required this.selected,
    required this.aux,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final medHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + AppBar().preferredSize.height);
    final medWidth = MediaQuery.of(context).size.width;

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
          child: ExpansionTile(
            title: Text(
              title,
              style: const TextStyle(
                fontFamily: "Poppins",
                color: Color(0xff323232),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            tilePadding: EdgeInsets.symmetric(horizontal: medWidth * .03),
            childrenPadding: EdgeInsets.only(
              bottom: medHeight * .01,
              left: medWidth * .03,
              right: medWidth * .03,
            ),
            // trailing: CupertinoSwitch(
            //   value: value,
            //   onChanged: onChanged,
            // ),
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: medHeight * .02),
                child: const Divider(height: 0),
              ),
              SizedBox(
                height: medHeight * .05,
                width: medWidth,
                child: ListView.separated(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: medWidth * .03),
                  ),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: medWidth * .24,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selected == index
                              ? Get.theme.colorScheme.primary
                              : const Color(0xffD9D9D9),
                          elevation: 0,
                        ),
                        onPressed: () {
                          _.selected(index, aux);
                        },
                        child: Text(
                          _.texts[index],
                          style: TextStyle(
                            fontFamily: "Segoe UI",
                            color: selected == index
                                ? Colors.white
                                : const Color(0xff323232),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
              // SizedBox(
              //   height: medHeight * .05,
              //   width: medWidth,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       SizedBox(
              //         width: medWidth * .26,
              //         child: ElevatedButton(
              //           style: selected == 0
              //               ? onElevatedButton
              //               : offElevatedButton,
              //           onPressed: () {
              //             _.selected(0, aux);
              //           },
              //           child: Text(
              //             "Manhã",
              //             style: selected == 0 ? onTextStyle : offTextStyle,
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: medWidth * .26,
              //         child: ElevatedButton(
              //           style: selected == 1
              //               ? onElevatedButton
              //               : offElevatedButton,
              //           onPressed: () {
              //             _.selected(1, aux);
              //           },
              //           child: Text(
              //             "Tarde",
              //             style: selected == 1 ? onTextStyle : offTextStyle,
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: medWidth * .26,
              //         child: ElevatedButton(
              //           style: selected == 2
              //               ? onElevatedButton
              //               : offElevatedButton,
              //           onPressed: () {
              //             _.selected(2, aux);
              //           },
              //           child: Text(
              //             "Noite",
              //             style: selected == 2 ? onTextStyle : offTextStyle,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        );
      },
    );
  }
}
