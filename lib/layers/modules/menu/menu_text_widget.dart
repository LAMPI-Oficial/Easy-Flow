import 'package:flutter/material.dart';

class MenuTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const MenuTextWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 16,
            color: const Color(0xFFD9D9D9),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
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
