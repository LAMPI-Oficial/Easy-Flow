import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextTabbarWidget extends StatelessWidget {
  final String tile;
  final bool isSelected;

  const TextTabbarWidget({
    Key? key,
    required this.tile,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: tile == "Representantes"
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: AutoSizeText(
          tile,
          maxLines: 1,
          maxFontSize: 13,
          // textAlign: TextAlign.start,
          style: TextStyle(
            color: isSelected ? Theme.of(context).primaryColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
