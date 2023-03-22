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
                          fontSize: 3,
                        ),
                      )
                    ],
                  ),
                ),
                title: LayoutBuilder(
                  builder: (p0, p1) {
                    TextPainter textPainter = TextPainter(
                      text: TextSpan(text: text),
                      textDirection: TextDirection.ltr,
                      maxLines: 3,
                    )..layout(maxWidth: p1.maxWidth);

                    int numberOfLines =
                        (textPainter.height / textPainter.preferredLineHeight)
                            .ceil();

                    return Text.rich(
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Segoe UI',
                      ),
                      textAlign: TextAlign.justify,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: text,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          TextSpan(
                            text: numberOfLines < 3
                                ? "\nVer mais..."
                                : " Ver mais...",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
