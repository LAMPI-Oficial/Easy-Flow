import 'package:easyflow/layers/modules/home/components/subtitle_comp.dart';
import 'package:easyflow/layers/modules/home/model/representatives_model.dart';
import 'package:flutter/material.dart';

class PageRepresentatives extends StatelessWidget {
  PageRepresentatives({super.key});

  final List<RepresentativesModel> representatives = [
    RepresentativesModel(
      uid: "0",
      name: "Mário Jamisson",
      imageUrl:
          "https://assets.nintendo.com/image/upload/f_auto/q_auto/dpr_2.0/c_scale,w_400/ncom/pt_BR/games/switch/n/new-super-mario-bros-u-deluxe-switch/description-image",
      email: "mariojamisson@gmail.com",
      area: "Games",
      turn: "Segunda-Feira. Turno Manha",
    ),
    RepresentativesModel(
      uid: "1",
      name: "Julia Fonseca",
      imageUrl:
          "https://cdn.britannica.com/59/182359-050-C6F38CA3/Scarlett-Johansson-Natasha-Romanoff-Avengers-Age-of.jpg",
      email: "juliafonseca@gmail.com",
      area: "Q&A",
      turn: "Segunda-Feira. Turno Manha",
    ),
    RepresentativesModel(
      uid: "2",
      name: "Raul Pereira",
      imageUrl:
          "http://m.lance.com.br/files/admin_slider_thumbnail/uploads/2022/12/19/63a0b3f5e4240.jpeg",
      email: "raulpereira@gmail.com",
      area: "UX-UI",
      turn: "Segunda-Feira. Turno Manha",
    ),
    RepresentativesModel(
      uid: "3",
      name: "Rubens Abraão",
      imageUrl:
          "https://classic.exame.com/wp-content/uploads/2018/10/brad-pitt-britain-allied-premiere.jpg?quality=70&strip=info&w=1017",
      email: "rubensabraao@gmail.com",
      area: "Representante Líder",
      turn: "Segunda-Feira. Turno Manha",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      child: ListView.builder(
        itemCount: representatives.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 50,
                width: 44.0,
                child: FadeInImage(
                  placeholder: const AssetImage(
                    "assets/images/collab_bro_image.png",
                  ),
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    representatives[index].imageUrl,
                  ),
                ),
              ),
            ),
            title: Card(
              elevation: 0,
              margin: const EdgeInsets.symmetric(vertical: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            representatives[index].name,
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
                          padding: EdgeInsets.only(left: 8.0, right: 2),
                          child: Icon(
                            Icons.verified_outlined,
                            size: 10,
                            color: Color(0xFF0085FF),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            representatives[index].area,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFF0085FF),
                              fontFamily: 'Segoe UI',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 0.0, bottom: 1),
                        child: Subtitle(
                          text: representatives[index].email,
                          icon: Icons.email_outlined,
                        )),
                    Subtitle(
                        text: representatives[index].turn, icon: Icons.alarm)
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
