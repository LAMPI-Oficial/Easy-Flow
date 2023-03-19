import 'package:flutter/material.dart';

class PageRepresentatives extends StatelessWidget {
  PageRepresentatives({super.key});

  final List<String> nomes = [
    "Mário Jamisson",
    "Julia Fonseca",
    "Raul Pereira",
    "Rubens Abraão",
  ];
  final List<String> fotos = [
    "https://assets.nintendo.com/image/upload/f_auto/q_auto/dpr_2.0/c_scale,w_400/ncom/pt_BR/games/switch/n/new-super-mario-bros-u-deluxe-switch/description-image",
    "https://cdn.britannica.com/59/182359-050-C6F38CA3/Scarlett-Johansson-Natasha-Romanoff-Avengers-Age-of.jpg",
    "http://m.lance.com.br/files/admin_slider_thumbnail/uploads/2022/12/19/63a0b3f5e4240.jpeg",
    "https://classic.exame.com/wp-content/uploads/2018/10/brad-pitt-britain-allied-premiere.jpg?quality=70&strip=info&w=1017"
  ];
  final List<String> email = [
    "Mariojamisson@gmail.com",
    "juliafonseca@gmail.com",
    "rubensabraao@gmail.com",
    "raulpereira@gmail.com",
  ];

  final List<String> areas = [
    "Games",
    "Q&A",
    "UX-UI",
    "Representante Líder",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: double.infinity,
                width: 45.0,
                child: FadeInImage(
                  placeholder: const AssetImage(
                    "assets/images/collab_bro_image.png",
                  ),
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    fotos[index],
                  ),
                ),
              ),
            ),
            title: Container(
              padding: const EdgeInsets.only(top: 2, left: 4),
              child: Card(
                elevation: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            nomes[index],
                            style: const TextStyle(
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                                color: Color(
                                  0xFF4A6F91,
                                ),
                                fontFamily: 'Segoe UI'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.verified_outlined,
                            color: Color(0xFF0085FF),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            areas[index],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF0085FF),
                              fontFamily: 'Segoe UI',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            color: Color(0xFF8B8B8B),
                            size: 15,
                          ),
                          Expanded(
                            child: Text(
                              email[index],
                              style: const TextStyle(
                                fontSize: 10,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.alarm,
                          size: 15,
                          color: Color(0xFF8B8B8B),
                        ),
                        Expanded(
                          child: Text(
                            "Segunda-Feira. Turno Manha",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
