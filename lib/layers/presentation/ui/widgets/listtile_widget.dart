import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final void Function()? onTap;
  final bool? selected;
  final Widget? title;
  const ListTileWidget({super.key, this.onTap, this.selected, this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected ?? false,
      title: title,
      tileColor: Colors.white,
      selectedTileColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      onTap: onTap,
    );
  }
}
