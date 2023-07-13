import 'package:easyflow/core/utils/validators_util.dart';
import 'package:easyflow/layers/presentation/controller/daily_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AddDailyPage extends StatelessWidget {
  const AddDailyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<DailyController>();
    return Scaffold(
        appBar: AppBar(title: const Text('Fazer daily')),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                      key: controller.formKeyDaily,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'O que foi feito hoje ?',
                            style: TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 16,
                              fontFamily: 'Segoe UI',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            'fale sobre o que foi feito hoje a respeito de suas tarefas, escreva suas duvidas ou empecilhos em suas tarefas',
                            style: TextStyle(
                              color: Color(0xFF8B8B8B),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: controller.descriptionTextController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) => Validators.combine(
                              [() => Validators.isNotEmpty(value)],
                            ),
                            maxLines: 10,
                          )
                        ],
                      )),
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () => controller.addDaily(context),
                child: Text('Finalizar'),
              ),
            )
          ],
        )));
  }
}
