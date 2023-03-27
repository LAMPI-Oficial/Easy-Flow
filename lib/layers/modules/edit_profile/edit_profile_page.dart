import 'package:easyflow/layers/modules/edit_profile/edit_form_widget.dart';
import 'package:easyflow/layers/modules/edit_profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0085FF),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Perfil",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 70,
                      color: const Color(0xFF0085FF),
                    ),
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                            8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 20,
                  child: Container(
                    width: 92,
                    height: 92,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: FadeInImage(
                        placeholder: const AssetImage(
                            "assets/images/collab_bro_image.png"),
                        image: const NetworkImage(
                          "https://cdn.britannica.com/59/182359-050-C6F38CA3/Scarlett-Johansson-Natasha-Romanoff-Avengers-Age-of.jpg",
                        ),
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return const Image(
                            image: AssetImage(
                              "assets/images/collab_bro_image.png",
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 18,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 85),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0085FF),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(
                          Icons.add_photo_alternate_outlined,
                          color: Colors.white,
                          size: 12,
                          fill: 0.5,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                color: const Color(0xFFFFFFFF),
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  children: [
                    EditFormWidget(
                      hintText: 'Nome Completo',
                      prefixIcon: const Icon(
                        Icons.badge_outlined,
                        size: 15,
                      ),
                      controller: controller.nameTextController,
                      textInputAction: TextInputAction.next,
                    ),
                    EditFormWidget(
                      hintText: 'E-mail',
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        size: 15,
                      ),
                      controller: controller.emailTextController,
                      textInputAction: TextInputAction.next,
                    ),
                    EditFormWidget(
                      // label: 'E-mail',
                      hintText: 'Curso',
                      prefixIcon: const Icon(
                        Icons.chrome_reader_mode_outlined,
                        size: 15,
                      ),
                      controller: controller.courseTextController,
                      textInputAction: TextInputAction.next,
                    ),
                    EditFormWidget(
                      hintText: 'Área',
                      prefixIcon: const Icon(
                        Icons.psychology_alt_outlined,
                        size: 15,
                      ),
                      controller: controller.areaTextController,
                      textInputAction: TextInputAction.next,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Salvar',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
