import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AddDayWidget extends StatelessWidget {
  final bool value;
  final int selected;
  final int aux;
  final String title;
  final void Function()? onPressed;
  final Function(bool)? onExpansionChanged;
  const AddDayWidget({
    super.key,
    required this.value,
    required this.selected,
    required this.aux,
    required this.title,
    this.onPressed,
    this.onExpansionChanged,
  });

  @override
  Widget build(BuildContext context) {
    final medHeight = MediaQuery.of(context).size.height;
    final medWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: medWidth * .90,
      child: ExpansionTile(
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        collapsedShape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: "Poppins",
            color: Color(0xff323232),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        tilePadding: EdgeInsets.symmetric(horizontal: medWidth * .03),
        childrenPadding: EdgeInsets.only(
          bottom: medHeight * .02,
          left: medWidth * .03,
          right: medWidth * .03,
        ),
        trailing: CupertinoSwitch(
          value: value,
          onChanged: (value) {},
        ),
        onExpansionChanged: onExpansionChanged,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: medHeight * .02),
            child: const Divider(
              height: 1,
              thickness: 1,
            ),
          ),
          SizedBox(
            height: medHeight * .04,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: medHeight * .04,
                crossAxisSpacing: medWidth * .03,
                mainAxisSpacing: 0,
              ),
              itemBuilder: (context, index) {
                return TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: selected == index
                        ? Theme.of(context).colorScheme.primary
                        : const Color(0xffD9D9D9),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: onPressed,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      color: selected == index
                          ? Colors.white
                          : const Color(0xff323232),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
