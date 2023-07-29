import 'package:easyflow/layers/presentation/ui/widgets/images/image_file_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/images/image_network_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageAdaptiveWidget extends StatelessWidget {
  final String value;
  final BoxFit? fit = BoxFit.cover;
  final void Function()? onTap;
  final double? height;
  final double? width;
  bool isMenu;
ImageAdaptiveWidget(
    this.value, {
    super.key,
    this.onTap,
    fit,
    this.width,
    this.height,
    this.isMenu = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: value.startsWith('http') || value.startsWith('https')
          ? ClipRRect(
              borderRadius: isMenu
                  ? BorderRadius.zero
                  : BorderRadius.circular(width == 50 ? 20 : 100),
              child: ImageNetworkWidget(
                value,
                fit: fit,
                height: height,
                width: width,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(width == 50 ? 20 : 100),
              child: ImageFileWidget(
                value,
                fit: fit,
                height: height,
                width: width,
              ),
            ),
    );
  }
}
