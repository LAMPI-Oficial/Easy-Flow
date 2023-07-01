import 'package:flutter/material.dart';

class ButtonTextFieldWidget extends Container {
  final String label;
  final String? hintText;
  final void Function()? onTap;
  final TextEditingController? controller;
  final String? initialValue;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final TextInputAction? textInputAction;
  ButtonTextFieldWidget({
    super.key,
    this.onTap,
    this.controller,
    required this.label,
    this.initialValue,
    this.hintText,
    this.validator,
    this.autovalidateMode,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: true,
        child: TextFormField(
          controller: controller,
          initialValue: initialValue,
          validator: validator,
          autovalidateMode: autovalidateMode,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black45,
            )),
            hintText: hintText,
            label: Text(
              label,
            ),
            suffixIcon: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
