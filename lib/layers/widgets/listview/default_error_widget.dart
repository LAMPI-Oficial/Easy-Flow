import 'package:flutter/material.dart';

class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          color: Theme.of(context).colorScheme.error,
          size: 50,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Erro ao carregar registros',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        )
      ],
    );
  }
}
