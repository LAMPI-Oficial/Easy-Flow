import 'package:easyflow/core/routes/app_pages.dart';
import 'package:easyflow/layers/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pushNamed(Routes.MENU),
            icon: const Icon(Icons.menu),
          ),
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
      ),
    );
  }
}
