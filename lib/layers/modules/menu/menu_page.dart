import 'package:easyflow/core/routes/app_pages.dart';
import 'package:easyflow/layers/modules/schedule/pages/schedule_page.dart';
import 'package:easyflow/layers/modules/menu/menu_text_widget.dart';
import 'package:easyflow/layers/modules/menu/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          child: ListView(
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
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 200,
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
                    mainAxisSize: MainAxisSize.min,
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
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(Routes.EDIT_PROFILE),
                                child: const Text(
                                  "Editar Perfil",
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 100,
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.only(
                            bottom: 80,
                            left: 10,
                            top: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 16,
              ),
              child: Column(
                children: [
                  MenuWidget(
                    icon: Icons.home_outlined,
                    title: "Inicio",
                    onTap: () => Navigator.of(context).pushNamed(Routes.HOME),
                  ),
                  MenuWidget(
                    icon: Icons.event_outlined,
                    title: "Horário",
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.SCHEDULE),
                  ),
                  MenuWidget(
                    icon: Icons.desktop_windows_outlined,
                    title: "Equipamentos",
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.EQUIPMENT),
                  ),
                  MenuWidget(
                    icon: Icons.diversity_3_outlined,
                    title: "Daily",
                    onTap: () => Navigator.of(context).pushNamed(Routes.DAILYS),
                  ),
                  MenuWidget(
                    icon: Icons.report_outlined,
                    title: "Reclamações",
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.COMPLAINTS),
                  ),
                  MenuWidget(
                    icon: Icons.help_center_outlined,
                    title: "Sobre",
                    onTap: () => Navigator.of(context).pushNamed(Routes.ABOUT),
                  ),
                  MenuWidget(
                    icon: Icons.logout_outlined,
                    title: "Sair",
                    onTap: () => Navigator.of(context).pushNamed(Routes.LOGIN),
                    isLogout: true,
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
