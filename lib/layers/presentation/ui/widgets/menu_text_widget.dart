import 'package:flutter/material.dart';

class MenuTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const MenuTextWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(
              icon,
              size: 16,
              color: const Color(0xFFD9D9D9),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
                color: Color(0xFFD9D9D9),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
