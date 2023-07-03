import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Pagina não encotrada',
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            child: ElevatedButton(
                onPressed: () => context.go('/'), child: const Text('Inicio')),
          )
        ],
      ),
    )));
  }
}
