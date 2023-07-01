import 'package:easyflow/layers/widgets/image_network_widget.dart';
import 'package:flutter/material.dart';

class CircleAccountWidget extends StatelessWidget {
  final String? urlPhoto;
  final String name;
  final double? maxRadius;
  const CircleAccountWidget({
    Key? key,
    required this.name,
    this.maxRadius,
    this.urlPhoto,
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
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary, shape: BoxShape.circle),
      child: urlPhoto != null
          ? ImageNetworkWidget(urlPhoto!)
          : Text(
              getInitials(name),
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).colorScheme.onPrimary),
            ),
    );
  }
}
