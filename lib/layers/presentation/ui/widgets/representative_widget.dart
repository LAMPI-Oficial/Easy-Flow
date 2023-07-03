import 'package:easyflow/layers/domain/entities/representative_model.dart';
import 'package:easyflow/layers/presentation/ui/widgets/circle_avatar_widget.dart';
import 'package:flutter/material.dart';

class RepresentativeWidget extends StatelessWidget {
  final RepresentativeModel representative;
  final void Function()? onTap;
  final bool? selected;
  const RepresentativeWidget(
      {super.key, required this.representative, this.onTap, this.selected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      selected: selected ?? false,
      selectedTileColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      tileColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      leading: CircleAvatarWidget(
        name: representative.name,
        urlPhoto: representative.imageUrl,
      ),
      title: Text(representative.name),
      subtitle: Row(
        children: [
          const Icon(
            Icons.verified_outlined,
            size: 14,
            color: Color(0xFF0085FF),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            representative.area,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF0085FF),
              fontFamily: 'Segoe UI',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
