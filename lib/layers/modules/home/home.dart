import 'package:easyflow/layers/modules/home/components/home_tile.dart';
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
                child: HomeTile(
                  tile: "Comunicados",
                  isSelected: controllerTab.index == 0,
                ),
              ),
              Tab(
                child: HomeTile(
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
            : Container(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 50),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom : 10.0),
                      child: Image.asset(
                        "assets/images/scan_delete.png",
                        color: const Color(0xFF4A6F91),
                      ),
                    ),
                    // const 
                    const Text.rich(
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Poxa, ainda não ",
                            style: TextStyle(
                              color: Color(0xFF4A6F90),
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          TextSpan(
                            text: "temos isso que você pesquisou ",
                            style: TextStyle(
                              color: Color(0xFF4A6F91),
                              // fontWeight: FontWeight.bold,
                            )
                          ),
                          TextSpan(
                            text: "tente outro",
                            style: TextStyle(
                              color: Color(0xFF4A6F90),
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ]
                      )
                    )

                    // Text(
                    //   "Poxa, ainda nao  temos isso que você pesquisou tente outro",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     color: Color(0xFF4A6F90),
                    //   ),
                    // )
                  ],
                ),
              ),
      ),
    );
  }
}
