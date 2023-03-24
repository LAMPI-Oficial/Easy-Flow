import 'package:flutter/material.dart';

class TextTabbarWidget extends StatefulWidget {
  final String tile;
  final bool isSelected;

  const TextTabbarWidget({
    Key? key,
    required this.tile,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<TextTabbarWidget> createState() => _TextTabbarWidgetState();
}

class _TextTabbarWidgetState extends State<TextTabbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.tile == "Representantes"
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: widget.isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Text(
          widget.tile,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: widget.isSelected
                ? Theme.of(context).primaryColor
                : Colors.white,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
