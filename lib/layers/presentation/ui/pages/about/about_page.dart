import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre"),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Easy",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      " Flow",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    Text(
                      "O mais rápido e pratico\n gerenciador de laboratório",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Tristique "
                  "lectus ut posuere sed felis sit interdum interdum "
                  "semper. Lorem leo commodo erat phasellus nunc. Enim"
                  " sed amet volutpat nunc viverra massa est. Dignissim"
                  " in nibh et sodales sed a tincidunt in. Aliquet a"
                  " sagittis magna dui nibh quis vel tristique. Semper ut"
                  " habitant tincidunt turpis. Nunc lacus risus massa venenatis"
                  " pulvinar semper convallis semper nunc. Fringilla convallis id"
                  " augue habitant fringilla arcu risus pretium risus. Cras arcu"
                  " parturient aliquet vitae maecenas elit pellentesque maecenas.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color.fromRGBO(139, 139, 139, 1),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
