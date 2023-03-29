import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;
  bool? isLogout;
  MenuWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.isLogout = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: ListTile(
        dense: true,
        leading: CircleAvatar(
          backgroundColor: isLogout!
              ? const Color(0xFFFFD4D6)
              : Theme.of(context).primaryColor,
          child: Icon(
            icon,
            color: isLogout! ? const Color(0xFFEF5157) : Colors.white,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
