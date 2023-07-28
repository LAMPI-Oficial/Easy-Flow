import 'package:easyflow/layers/domain/entities/announcements_entity.dart';
import 'package:easyflow/layers/presentation/ui/widgets/images/image_adaptive_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/images/image_network_widget.dart';
import 'package:flutter/material.dart';

class AnnouncementsWidget extends StatelessWidget {
  final AnnouncementsEntity announcements;
  const AnnouncementsWidget({super.key, required this.announcements});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (announcements.urlPhoto != null)
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: ImageNetworkWidget(
                      announcements.urlPhoto!,
                    ),
                  ),
                if (announcements.urlPhoto != null)
                  const SizedBox(
                    height: 8,
                  ),
              ],
            ),
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            leading: Container(
              width: 50,
              height: 55,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: const ImageAdaptiveWidget('assets/images/logo.png',
                  height: 55),
            ),
            title: Text(
              announcements.description,
            ),
          ),
        ],
      ),
    );
  }
}
