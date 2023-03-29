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
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.close,
            size: 16,
          ),
        ),
        title: const Text("Menu"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
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
                top: 10,
                child: Container(
                  width: 330,
                  height: 170,
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
                        margin: const EdgeInsets.only(bottom: 60, left: 10),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black,
                              ),
                              width: 92,
                              height: 40,
                            ),
                            SizedBox(
                              // height: 30,
                              width: 92,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Editar Perfil",
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.only(bottom: 60, left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            MenuTextWidget(
                              icon: Icons.badge_outlined,
                              text: "carla Pereira",
                            ),
                            MenuTextWidget(
                              icon: Icons.mail,
                              text: "carlapereira@gmail.com",
                            ),
                            MenuTextWidget(
                              icon: Icons.chrome_reader_mode_outlined,
                              text: "carlapereira@gmail.com",
                            ),
                            MenuTextWidget(
                              icon: Icons.lock,
                              text: "**********",
                            ),
                            MenuTextWidget(
                                icon: Icons.psychology_alt_outlined,
                                text: "UX-UI"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              children: [
                MenuWidget(
                  icon: Icons.home_outlined,
                  title: "Inicio",
                  onTap: () {},
                ),
                MenuWidget(
                  icon: Icons.event_outlined,
                  title: "Ver horários",
                  onTap: () {},
                ),
                MenuWidget(
                  icon: Icons.desktop_windows_outlined,
                  title: "Equipamentos",
                  onTap: () {},
                ),
                MenuWidget(
                  icon: Icons.desktop_windows_outlined,
                  title: "Verificar solicitações",
                  onTap: () {},
                ),
                MenuWidget(
                  icon: Icons.diversity_3_outlined,
                  title: "Analisar daily",
                  onTap: () {},
                ),
                MenuWidget(
                  icon: Icons.report_outlined,
                  title: "Ver reclamações",
                  onTap: () {},
                ),
                MenuWidget(
                  icon: Icons.help_center_outlined,
                  title: "Sobre",
                  onTap: () {},
                ),
                MenuWidget(
                  icon: Icons.logout_outlined,
                  title: "Sair",
                  onTap: () {},
                  isLogout: true,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
