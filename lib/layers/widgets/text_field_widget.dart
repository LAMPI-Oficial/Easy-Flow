import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final double? width;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String?)? onSaved;
  final bool? autofocus;
  final EdgeInsets? margin;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLenght;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final bool? security;
  final AutovalidateMode? autovalidateMode;

  const TextFieldWidget(
      {Key? key,
      this.controller,
      this.label,
      this.width,
      this.hintText,
      this.validator,
      this.keyboardType,
      this.textInputAction,
      this.onSaved,
      this.margin,
      this.textAlign,
      this.inputFormatters,
      this.maxLenght,
      this.obscureText,
      this.suffix,
      this.autofocus,
      this.onChanged,
      this.security,
      this.autovalidateMode,
      this.prefixIcon})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool eye = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Text(widget.label!,
                  style: const TextStyle(
                    fontFamily: 'Segoe_UI',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ))
              : Container(),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 16),
            child: TextFormField(
              key: widget.key,
              autovalidateMode: widget.autovalidateMode,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFD4D4D4))),
                  contentPadding: const EdgeInsets.all(0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: widget.hintText,
                  errorStyle: const TextStyle(
                    fontFamily: 'Segoe_UI',
                  ),
    
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.security == true
                      ? GestureDetector(
                          onTap: () => setState(() {
                                eye = !eye;
                              }),
                          child: Icon(
                            eye == true
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 23,
                          ))
                      : widget.suffix),
              onChanged: widget.onChanged,
              controller: widget.controller,
              validator: widget.validator,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              maxLength: widget.maxLenght,
              onSaved: widget.onSaved,
              autofocus: widget.autofocus ?? false,
              obscureText: widget.security == true
                  ? widget.obscureText == null
                      ? eye
                      : widget.obscureText!
                  : false,
              obscuringCharacter: "∗",
              textAlign: widget.textAlign ?? TextAlign.left,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              inputFormatters: widget.inputFormatters,
            ),
          ),
        ],
      ),
    );
  }
}
