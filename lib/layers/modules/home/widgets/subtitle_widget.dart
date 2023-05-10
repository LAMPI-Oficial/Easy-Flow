

import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const SubtitleWidget({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 3),
          child: Icon(
            icon,
            size: 10,
            color: const Color(0xFF8B8B8B),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF8B8B8B)
            ),
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

