import 'package:easyflow/layers/presentation/ui/widgets/images/image_adaptive_widget.dart';
import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  final void Function()? onTap;
  final String? urlPhoto;
  final String name;
  final double? maxRadius;
  const CircleAvatarWidget({
    Key? key,
    required this.name,
    this.maxRadius,
    this.urlPhoto,
    this.onTap,
  }) : super(key: key);

  String getInitials(String fullName) {
    List<String> nameSplit = fullName.split(" ");
    String initials = "";

    if (nameSplit.isNotEmpty) {
      initials += nameSplit[0][0].toUpperCase();

      if (nameSplit.length > 1) {
        initials += nameSplit[1][0].toUpperCase();
      }
    }

    return initials;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: maxRadius ?? 50,
        width: maxRadius ?? 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle),
        child: urlPhoto != null
            ? ImageAdaptiveWidget(urlPhoto!)
            : Text(
                getInitials(name),
                style: TextStyle(
                    fontSize: maxRadius != null ? maxRadius! / 3 : 14,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
      ),
    );
  }
}
