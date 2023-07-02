import 'package:easyflow/layers/modules/edit_profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<EditProfileController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Perfil",
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 130,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0085FF),
                  ),
                ),
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
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Nome Completo'),
                        prefixIcon: Icon(
                          Icons.badge_outlined,
                          size: 15,
                        ),
                      ),
                      controller: controller.nameTextController,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('E-mail'),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          size: 15,
                        ),
                      ),
                      controller: controller.emailTextController,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Curso'),
                        prefixIcon: Icon(
                          Icons.chrome_reader_mode_outlined,
                          size: 15,
                        ),
                      ),
                      controller: controller.courseTextController,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Área'),
                        prefixIcon: Icon(
                          Icons.psychology_alt_outlined,
                          size: 15,
                        ),
                      ),
                      controller: controller.areaTextController,
                      textInputAction: TextInputAction.next,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Salvar',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
