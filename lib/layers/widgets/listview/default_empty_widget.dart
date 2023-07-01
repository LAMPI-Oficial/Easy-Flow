import 'package:flutter/material.dart';

class DefaultEmptyWidget extends StatelessWidget {
  const DefaultEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.block,
          size: 50,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Nenhum registro encontrado',
        )
      ],
    );
  }
}
