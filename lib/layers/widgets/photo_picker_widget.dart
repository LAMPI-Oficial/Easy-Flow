import 'package:flutter/material.dart';

class PhotoPickerWidget extends StatelessWidget {
  const PhotoPickerWidget({
    Key? key,
    this.onTap,
    this.urlPhoto,
  }) : super(key: key);

  final void Function()? onTap;
  final String? urlPhoto;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            maxRadius: 55,
            foregroundImage: urlPhoto != null
                ? AssetImage(
                    urlPhoto!,
                  )
                : null,
            child: const Icon(
              Icons.add_photo_alternate_outlined,
              size: 50,
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Text(
            urlPhoto == null ? 'Adicionar foto' : 'Editar foto',
            style: const TextStyle(fontFamily: 'Poppins',fontSize: 13),
          ),
        ],
      ),
    );
  }
}
