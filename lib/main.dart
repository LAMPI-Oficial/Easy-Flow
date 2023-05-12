import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            title: Text(
              'Daily',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 18,
              )),
            ),
          ),
          body: Container(
            color: const Color.fromARGB(245, 245, 245, 255),
            child: Column(
              children: [
                SizedBox(
                  height: 49,
                ),
                Task('Daily feito em 04 de Janeiro 2023        '),
                Task('Daily feito em 05 de Janeiro 2023        '),
                Task('Daily feito em 06 de Janeiro 2023        '),
                Task('Daily feito em 07 de Janeiro 2023        '),
                Task('Daily feito em 08 de Janeiro 2023        '),
              ],
            ),
          ),
        floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String nome;
  const Task(this.nome, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topCenter,
      color: const Color.fromARGB(245, 245, 245, 255),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: 330,
            height: 40,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nome,
                  style: GoogleFonts.notoSans(
                      textStyle: TextStyle(
                    color: Color.fromARGB(74, 111, 114, 255),
                  )),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(54, 34)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'abrir',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
