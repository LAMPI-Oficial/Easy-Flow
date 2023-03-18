import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final tamanho = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: TextFormField(
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
            // contentPadding: const EdgeInsets.all(8),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            fillColor: Colors.white,
            prefixIcon: const Icon(Icons.search),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(10, tamanho * 0.08),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Comunicados",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Representantes",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
