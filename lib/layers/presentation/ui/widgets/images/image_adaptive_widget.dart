import 'package:easyflow/layers/presentation/ui/widgets/images/image_file_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/images/image_network_widget.dart';
import 'package:flutter/material.dart';


class ImageAdaptiveWidget extends StatelessWidget {
  final String value;
  final BoxFit? fit = BoxFit.cover;
  final void Function()? onTap;
  final double? height;
  final double? width;
  const ImageAdaptiveWidget(this.value,
      {super.key, this.onTap, fit, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: value.startsWith('http') || value.startsWith('https')
          ? ImageNetworkWidget(
              value,
              fit: fit,
              height: height,
              width: width,
            )
          : ImageFileWidget(
              value,
              fit: fit,
              height: height,
              width: width,
            ),
    );
  }
}
