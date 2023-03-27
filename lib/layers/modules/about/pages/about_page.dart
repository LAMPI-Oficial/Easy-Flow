import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Easy",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins"),
                  ),
                  Text(
                    " Flow",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Poppins"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  Text(
                    "O mais rápido e pratico\n gerenciador de laboratório",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
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
                  fontFamily: "Poppins",
                  color: Color.fromRGBO(139, 139, 139, 1),
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
