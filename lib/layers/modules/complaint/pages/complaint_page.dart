import 'package:easyflow/core/utils/validators_util.dart';
import 'package:easyflow/layers/modules/complaint/complaint_controller.dart';
import 'package:easyflow/layers/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:get/get.dart';

class ComplaintPage extends GetView<ComplaintController> {
  const ComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reclamação"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: controller.formKey,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    TextFieldWidget(
                      label: "Digite seu nome completo",
                      hintText: "nome completo",
                      controller: controller.nameTextController,
                      keyboardType: TextInputType.name,
                      prefixIcon: const Icon(Icons.badge_outlined),
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => Validators.combine(
                        [
                          () => Validators.isNotEmpty(value),
                          () => Validators.isName(value)
                        ],
                      ),
                    ),
                    TextFieldWidget(
                      label: "Digite seu e-mail",
                      hintText: "e-mail",
                      controller: controller.emailTextController,
                      prefixIcon: const Icon(Icons.email_outlined),
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      validator: (value) => Validators.combine(
                        [
                          () => Validators.isNotEmpty(value),
                          () => Validators.isEmail(value)
                        ],
                      ),
                    ),
                    const Text("Descreva sua reclamação",
                        style: TextStyle(
                          fontFamily: 'Segoe_UI',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Escreva a sua reclamação com detalhes precisos",
                        style: TextStyle(
                          fontFamily: 'Segoe_UI',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
                        labelText: '',
                      ),
                      minLines: 6,
                      maxLines: 6,
                      validator: (value) => Validators.combine(
                        [
                          () => Validators.isNotEmpty(value),
                          () => Validators.isDescription(value)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: FormBuilderFilePicker(
                        name: "Arquivo",
                        previewImages: true,
                        allowMultiple: true,
                        maxFiles: 1,
                        withData: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => Validators.combine(
                          [
                            () => Validators.isArchive(value),
                          ],
                        ),
                        onChanged: (val) {},
                        decoration: InputDecoration(
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
                        typeSelectors: [
                          TypeSelector(
                            type: FileType.any,
                            selector: SizedBox(
                              width: MediaQuery.of(context).size.width - 58,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.add_link_outlined,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "Anexar arquivo",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  controller.complaint();
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                child: const Text(
                  "Enviar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
