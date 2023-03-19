import 'package:flutter/material.dart';

class PageAnnouncements extends StatelessWidget {
  const PageAnnouncements({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Card(
            elevation: 1,
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
                      title: const Expanded(
                        child: Text(
                          "Aquisição de macbooks para o laboratório gera entusiasmo para os desenvolvedores.",
                          maxLines: 3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Segoe UI',
                            wordSpacing: 0.25,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) =>
            const Padding(padding: EdgeInsets.all(8)),
        itemCount: 5,
      ),
    );
  }
}
