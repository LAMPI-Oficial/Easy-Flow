import 'package:easyflow/layers/modules/home/widgets/card_annoumencements_widget.dart';
import 'package:flutter/material.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: GridView.builder(
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 240,
              crossAxisCount: qtdeColumn(p1.maxWidth),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return const CardAnnoumencementsWidget(
                text:
                    "Aquisição de macbooks para o laboratório gera entusiasmo para os desenvolvedores.",
              );
            },
          ),
        );
      },
    );
  }

  int qtdeColumn(double largura) {
    int column = 1;
    if (largura < 500) {
      column = 1;
    } else if (largura < 800) {
      column = 2;
    } else if (largura < 1000) {
      column = 3;
    } else if (largura < 1200) {
      column = 4;
    } else if (largura >= 1200) {
      column = 5;
    }
    return column;
  }
}
