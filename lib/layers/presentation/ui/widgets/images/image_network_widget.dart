import 'package:flutter/material.dart';

class ImageNetworkWidget extends StatelessWidget {
  final String value;
  final BoxFit? fit = BoxFit.cover;
  final void Function()? onTap;
  final double? height;
  final double? width;
  const ImageNetworkWidget(this.value,
      {super.key, this.onTap, fit, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      value,
      fit: fit,
      height: height,
      width: width,
      errorBuilder: (context, error, stackTrace) => const Icon(
        Icons.error,
        color: Colors.red,
      ),
      loadingBuilder: (context, child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
      },
    );
  }
}
