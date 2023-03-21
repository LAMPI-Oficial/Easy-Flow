import 'package:flutter/material.dart';

class CardAnnoumencementsWidget extends StatelessWidget {
  final String text;
  const CardAnnoumencementsWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/noticias.png",
                    ),
                  ),
                ),
                height: 150,
                width: 280,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  maxRadius: 25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "GDPPI",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Grupo discente de programação\n e projetos inovadores ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 2,
                        ),
                      )
                    ],
                  ),
                ),
                title: Text(
                  text,
                  maxLines: 3,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Segoe UI',
                    wordSpacing: 0.25,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
