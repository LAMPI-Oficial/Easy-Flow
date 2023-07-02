import 'package:easyflow/core/utils/validators_util.dart';
import 'package:easyflow/layers/modules/complaint/complaint_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AddComplaintPage extends StatelessWidget {
  const AddComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ComplaintController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fazer Reclamação"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Descreva sua reclamação",
                            style: TextStyle(
                              fontFamily: 'Segoe_UI',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "Escreva a sua reclamação com detalhes precisos",
                          style: TextStyle(
                            fontFamily: 'Segoe_UI',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: controller.descriptionTextController,
                          keyboardType: TextInputType.multiline,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0xFFD4D4D4),
                              ),
                            ),
                          ),
                          maxLines: 10,
                          validator: (value) => Validators.combine(
                            [
                              () => Validators.isNotEmpty(value),
                              () => Validators.isDescription(value)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Enviar",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
