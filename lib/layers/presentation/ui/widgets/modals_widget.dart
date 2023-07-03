import 'package:flutter/material.dart';

class Modals {
  static page(
      {required BuildContext context,
      Widget? title,
     Widget? body,
      }) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        useSafeArea: true,
        enableDrag: false,
        builder: (context) => Scaffold(
            appBar: AppBar(
              title: title,
              leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close)),
            ),
            body: body));
  }

   static imagePicker(context,
      {void Function()? onTakePhoto, void Function()? onChoosePhoto}) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              color: Colors.white,
              width: double.infinity,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Adicionar foto',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.close))
                      ],
                    ),
                  ),
                  ListTile(
                    minLeadingWidth: 30,
                    leading: const Icon(Icons.camera_alt_outlined),
                    title: const Text('Tirar uma foto'),
                    onTap: onTakePhoto,
                  ),
                  const Divider(),
                  ListTile(
                    minLeadingWidth: 30,
                    leading: const Icon(Icons.image_outlined),
                    title: const Text('Escolher foto'),
                    onTap: onChoosePhoto,
                  ),
                  const Divider(),
                ],
              ),
            ));
  }
}
