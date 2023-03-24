import 'package:easyflow/layers/modules/home/controller/home_controller.dart';
import 'package:easyflow/layers/modules/home/pages/announcements.dart';
import 'package:easyflow/layers/modules/home/pages/representatives.dart';
import 'package:easyflow/layers/modules/home/widgets/text_tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              controller: controller.controllerTextFormField.value,
              onChanged: (_) => controller.pesquisar(),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: "Buscar",
                hintStyle: const TextStyle(
                  fontSize: 16,
                ),
                filled: true,
                isDense: true,
                isCollapsed: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 18,
                ),
              ),
            ),
          ),
          bottom: TabBar(
            controller: controller.controllerTab,
            tabs: [
              GetX<HomeController>(
                builder: (ct) {
                  return Tab(
                    child: TextTabbarWidget(
                      tile: "Comunicados",
                      isSelected: ct.selecao.value == true,
                    ),
                  );
                },
              ),
              GetX<HomeController>(
                builder: (ct) {
                  return Tab(
                    child: TextTabbarWidget(
                      tile: "Representantes",
                      isSelected: ct.selecao.value == false,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller.controllerTab,
          children: [
            const PageAnnouncements(),
            PageRepresentatives(
              representatives: controller.representatives,
            ),
          ],
        ),
      ),
    );
  }
}
