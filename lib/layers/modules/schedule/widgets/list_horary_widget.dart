import 'package:flutter/material.dart';

class ListHoraryWidget extends StatelessWidget {
  final String? numTable;
  final String? name;
  final String? day;
  final String? turn;

  const ListHoraryWidget({
    super.key,
    required this.numTable,
    required this.name,
    required this.day,
    required this.turn,
  });

  static const textStyle = TextStyle(
    fontFamily: "Segoe UI",
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Color(0xff4A6F90),
  );

  @override
  Widget build(BuildContext context) {
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
                  color:Theme.of(context).colorScheme.primary,
                ),
                height: constraints.maxHeight,
                child: Center(
                  child: Text(
                    numTable!,
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
                    name!,
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
                    day!,
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
                    turn!,
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
