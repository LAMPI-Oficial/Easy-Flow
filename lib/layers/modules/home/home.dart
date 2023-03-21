import 'package:easyflow/layers/modules/home/components/comp_no_found.dart';
import 'package:easyflow/layers/widgets/text_tabbar_widget.dart';
import 'package:easyflow/layers/modules/home/pages/announcements.dart';
import 'package:easyflow/layers/modules/home/pages/representatives.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controllerTab;

  @override
  void initState() {
    super.initState();
    controllerTab = TabController(length: 2, vsync: this);
    controllerTab.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controllerTab.dispose();
    super.dispose();
  }

  final TextEditingController _controllerForm = TextEditingController();
  bool isEmpty = true;
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
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextFormField(
              controller: _controllerForm,
              onChanged: (texto) {
                setState(() {
                  if (texto != "") {
                    isEmpty = false;
                  } else {
                    isEmpty = true;
                  }
                });
              },
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
            controller: controllerTab,
            tabs: [
              Tab(
                child: TextTabbarWidget(
                  tile: "Comunicados",
                  isSelected: controllerTab.index == 0,
                ),
              ),
              Tab(
                child: TextTabbarWidget(
                  tile: "Representantes",
                  isSelected: controllerTab.index == 1,
                ),
              ),
            ],
          ),
        ),
        body: isEmpty
            ? TabBarView(
                controller: controllerTab,
                children: [
                  const PageAnnouncements(),
                  PageRepresentatives(),
                ],
              )
            : const CompNoFound(),
      ),
    );
  }
}
