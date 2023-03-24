import 'package:flutter/material.dart';

class CircleWidget extends Container {
  CircleWidget({super.key, this.top, this.bottom, this.left, this.right});
  double? top;
  double? bottom;
  double? left;
  double? right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: 172,
        height: 172,
        decoration: const BoxDecoration(
            color: Color(0xFFD9D9D9), shape: BoxShape.circle),
      ),
    );
  }
}
