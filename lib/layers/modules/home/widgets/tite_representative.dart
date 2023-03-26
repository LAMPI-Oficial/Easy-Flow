import 'package:auto_size_text/auto_size_text.dart';
import 'package:easyflow/layers/modules/home/widgets/subtitle_widget.dart';
import 'package:easyflow/layers/modules/home/model/representatives_model.dart';
import 'package:flutter/material.dart';

class TileRepresentativeWidget extends StatelessWidget {
  final RepresentativesModel representative;
  const TileRepresentativeWidget({super.key, required this.representative});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 50,
          width: 44.0,
          child: FadeInImage(
            placeholder: const AssetImage(
              "assets/images/collab_bro_image.png",
            ),
            fit: BoxFit.cover,
            image: NetworkImage(
              representative.imageUrl,
            ),
          ),
        ),
      ),
      title: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AutoSizeText(
                  representative.name,
                  maxLines: 1,
                  maxFontSize: 14,
                  style: const TextStyle(
                      fontSize: 14,
                      // overflow: TextOverflow.ellipsis,
                      color: Color(
                        0xFF4A6F91,
                      ),
                      fontFamily: 'Segoe UI'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 2),
                  child: Icon(
                    Icons.verified_outlined,
                    size: 10,
                    color: Color(0xFF0085FF),
                  ),
                ),
                AutoSizeText(
                  representative.area,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF0085FF),
                    fontFamily: 'Segoe UI',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // const Spacer()
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, bottom: 1),
              child: SubtitleWidget(
                text: representative.email,
                icon: Icons.email_outlined,
              ),
            ),
            SubtitleWidget(
              text: representative.turn,
              icon: Icons.alarm,
            )
          ],
        ),
      ),
    );
  }
}
