import 'package:easyflow/layers/modules/home/controller/home_controller.dart';
import 'package:easyflow/layers/modules/home/pages/announcements.dart';
import 'package:easyflow/layers/modules/home/pages/comp_no_found.dart';
import 'package:easyflow/layers/modules/home/pages/representatives.dart';
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
            height: 32,
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              controller: controller.controllerTextFormField,
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
            indicatorSize: TabBarIndicatorSize.label,
            // indicatorWeight: 10,
            isScrollable: true,
            indicatorPadding: const EdgeInsets.symmetric(
              horizontal: -10,
              vertical: 10,
            ),
            unselectedLabelColor: Colors.white,
            labelColor: Theme.of(context).primaryColor,
            labelStyle: const TextStyle(
              fontSize: 13,
            ),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ),
              color: Colors.white,
            ),
            tabs: const [
              Tab(
                text: "Comunicados",
              ),
              Tab(
                text: "Representantes",
              ),
            ],
          ),
        ),
        body: Obx(
          () => TabBarView(
            controller: controller.controllerTab,
            children: [
              controller.textEmpty
                  ? const PageAnnouncements()
                  : const CompNoFound(),
              controller.representatives.length > 0
                  ? PageRepresentatives(
                      representatives: controller.representatives,
                    )
                  : const CompNoFound(),
            ],
          ),
        ),
      ),
    );
  }
}
