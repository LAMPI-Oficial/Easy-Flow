import 'package:easyflow/layers/modules/menu/menu_text_widget.dart';
import 'package:easyflow/layers/modules/menu/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 80,
                      color: const Color(0xFF0085FF),
                    ),
                    Container(
                      height: 107,
                      decoration: const BoxDecoration(
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
                  top: 45,
                  bottom: -75,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                          16,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 80, left: 10),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                width: 92,
                                height: 92,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: FadeInImage(
                                    placeholder: const AssetImage(
                                        "assets/images/collab_bro_image.png"),
                                    image: const NetworkImage(
                                      "https://cdn.britannica.com/59/182359-050-C6F38CA3/Scarlett-Johansson-Natasha-Romanoff-Avengers-Age-of.jpg",
                                    ),
                                    fit: BoxFit.cover,
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return const Image(
                                        image: AssetImage(
                                          "assets/images/collab_bro_image.png",
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                                width: 88,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    textStyle: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () =>
                                      context.push('/menu/profile/edit'),
                                  child: const Text(
                                    "Editar Perfil",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.all(8),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MenuTextWidget(
                                  icon: Icons.badge_outlined,
                                  text: "carla pereira",
                                ),
                                MenuTextWidget(
                                  icon: Icons.mail,
                                  text: "carlapereira@gmail.com",
                                ),
                                MenuTextWidget(
                                  icon: Icons.chrome_reader_mode_outlined,
                                  text: "Análise d. de sistemas",
                                ),
                                MenuTextWidget(
                                  icon: Icons.lock,
                                  text: "**********",
                                ),
                                MenuTextWidget(
                                  icon: Icons.psychology_alt_outlined,
                                  text: "UX-UI",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 16,
              ),
              child: Column(
                children: [
                  MenuWidget(
                    icon: Icons.home_outlined,
                    title: "Inicio",
                    onTap: () => context.push('/home'),
                  ),
                  MenuWidget(
                    icon: Icons.event_outlined,
                    title: "Horário",
                    onTap: () => context.push('/menu/schedule'),
                  ),
                  MenuWidget(
                    icon: Icons.desktop_windows_outlined,
                    title: "Equipamentos",
                    onTap: () => context.push('/menu/equipments'),
                  ),
                  MenuWidget(
                    icon: Icons.diversity_3_outlined,
                    title: "Daily",
                    onTap: () => context.push('/menu/dailys'),
                  ),
                  MenuWidget(
                    icon: Icons.report_outlined,
                    title: "Reclamações",
                    onTap: () => context.push('/menu/complaints'),
                  ),
                  MenuWidget(
                    icon: Icons.help_center_outlined,
                    title: "Sobre",
                    onTap: () => context.push('/menu/about'),
                  ),
                  MenuWidget(
                    icon: Icons.logout_outlined,
                    title: "Sair",
                    onTap: () => context.push('/login'),
                    isLogout: true,
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
