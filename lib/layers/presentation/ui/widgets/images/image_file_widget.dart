import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageFileWidget extends StatelessWidget {
  final String value;
  final BoxFit? fit = BoxFit.cover;
  final void Function()? onTap;
  final double? height;
  final double? width;
  const ImageFileWidget(this.value,
      {super.key, this.onTap, fit, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? Image.network(
            value,
            fit: fit,
            height: height,
            width: width,
          )
        : Image.file(
            File(value),
            fit: fit,
            height: height,
            width: width,
          );
  }
}
