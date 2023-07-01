import 'package:easyflow/layers/data/model/announcements_model.dart';
import 'package:easyflow/layers/data/model/representative_model.dart';
import 'package:easyflow/layers/widgets/circle_account_widget.dart';
import 'package:easyflow/layers/widgets/image_network_widget.dart';
import 'package:flutter/material.dart';

class AnnouncementsWidget extends StatelessWidget {
  final AnnouncementsModel announcements;
  final RepresentativeModel representative;
  const AnnouncementsWidget(
      {super.key, required this.announcements, required this.representative});

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
                Text(
                  announcements.description,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            leading: CircleAccountWidget(
              name: representative.name,
              urlPhoto: representative.imageUrl,
            ),
            title: Row(
              children: [
                Text(representative.name),
                const SizedBox(
                  width: 16,
                ),
                const Icon(
                  Icons.verified_outlined,
                  size: 12,
                  color: Color(0xFF0085FF),
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  representative.area,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF0085FF),
                    fontFamily: 'Segoe UI',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
