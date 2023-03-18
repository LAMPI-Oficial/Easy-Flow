import 'package:easyflow/layers/modules/home/components/home_tile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String opcao = "Comunicados";
  @override
  Widget build(BuildContext context) {
    final tamanho = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(top: 8),
          height: tamanho * 0.05,
          child: TextFormField(
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
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(10, tamanho * 0.08),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: HomeTile(
                    tile: "Comunicados",
                    isSelected: opcao == "Comunicados",
                    onPressed: () {
                      setState(() {
                        opcao = "Comunicados";
                      });
                    },
                  ),
                ),
                HomeTile(
                  tile: "Representantes",
                  isSelected: opcao == "Representantes",
                  onPressed: () {
                    setState(() {
                      opcao = "Representantes";
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
