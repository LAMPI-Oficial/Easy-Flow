import 'package:flutter/material.dart';

class PageRepresentatives extends StatelessWidget {
  PageRepresentatives({super.key});

  final List<String> nomes = [
    "Mário Jamisson",
    "Julia Fonseca",
    "Rubens Abraão",
    "Raul Pereira",
  ];
  final List<String> fotos = [
    "https://assets.nintendo.com/image/upload/f_auto/q_auto/dpr_2.0/c_scale,w_400/ncom/pt_BR/games/switch/n/new-super-mario-bros-u-deluxe-switch/description-image",
    "https://cdn.britannica.com/59/182359-050-C6F38CA3/Scarlett-Johansson-Natasha-Romanoff-Avengers-Age-of.jpg",
    "http://m.lance.com.br/files/admin_slider_thumbnail/uploads/2022/12/19/63a0b3f5e4240.jpeg",
    "https://img.r7.com/images/blog-de-genesis-18052021162703362?dimensions=677x369"
  ];
  final List<String> email = [
    "Mariojamisson@gmail.com",
    "juliafonseca@gmail.com",
    "rubensabraao@gmail.com",
    "raulpereira@gmail.com",
  ];

  final List<String> areas = ["Games", "Q&A", "Representante Líder", "UX-UI"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemCount: 4,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                height: 50.0,
                width: 44.0,
                child: FadeInImage(
                  placeholder:
                      const AssetImage("assets/images/collab_bro_image.png"),
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    fotos[index],
                  ),
                ),
              ),
            ),
            title: Row(
              children: [
                Text( 
                  nomes[index],
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(
                        0xFF4A6F91,
                      ),
                      fontFamily: 'Segoe UI'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.verified_outlined,
                    color: Color(0xFF0085FF),
                  ),
                ),
                Text(
                  areas[index],
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0085FF),
                      fontFamily: 'Segoe UI'),
                ),
              ],
            ),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      color: Color(0xFF8B8B8B),
                      size: 15,
                    ),
                    Text(
                      email[index],
                      style: const TextStyle(fontSize: 15),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.alarm,
                      size: 15,
                      color: Color(0xFF8B8B8B),
                    ),
                    Text("Segunda-Feira. Turno Manha")
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
