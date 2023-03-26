import 'package:flutter/material.dart';

class DropButtonWidget extends StatelessWidget {
  final int flex;
  final List<DropdownMenuItem<dynamic>>? items;
  final void Function(dynamic)? onChanged;
  final String? hint;
  final String? value;

  const DropButtonWidget({
    super.key,
    required this.flex,
    required this.items,
    required this.onChanged,
    required this.hint,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Center(
        child: DropdownButton(
          alignment: AlignmentDirectional.center,
          iconEnabledColor: const Color(0xff4A6F90),
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: Color(0xff4A6F90),
          ),
          underline: Container(height: 0),
          hint: Text(hint!),
          elevation: 0,
          value: value,
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
