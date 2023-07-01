import 'package:easyflow/layers/modules/splash_screen/widgets/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:go_router/go_router.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            CircleWidget(
              top: 20,
              left: -86,
            ),
            CircleWidget(
              top: -86,
              right: 30,
            ),
            CircleWidget(
              left: 20,
            ),
            CircleWidget(
              right: -86,
            ),
            Column(
              children: [
                Expanded(
                  child: Image.asset('assets/images/collab_bro_image.png'),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                'Easy ',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 40,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w700),
                              ),
                              const AutoSizeText(
                                'Flow',
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 40),
                              )
                            ],
                          ),
                        ),
                        const Expanded(
                          child: AutoSizeText(
                            'O mais rápido e pratico gerenciador de laboratório',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: AutoSizeText(
                            'crie sua conta ou faça login e deixe sua vida mais pratica',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Color(0xFF8B8B8B),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () => context.push('/login'),
                            child: const Text('Começar'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
