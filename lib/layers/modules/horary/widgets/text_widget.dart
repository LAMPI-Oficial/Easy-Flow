import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final int flex;
  final String? title;

  const TextWidget({
    super.key,
    required this.flex,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        title!,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontFamily: "Segoe UI",
          fontWeight: FontWeight.w400,
          fontSize: 13,
          color: Color(0xff4A6F90),
        ),
      ),
    );
  }
}
