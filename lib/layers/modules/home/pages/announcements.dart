import 'package:easyflow/layers/modules/home/components/card_announcements_comp.dart';
import 'package:flutter/material.dart';

class PageAnnouncements extends StatelessWidget {
  const PageAnnouncements({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return const CardAnnoumencementsComp(
              text:
                  "Aquisição de macbooks para o laboratório gera entusiasmo para os desenvolvedores.");
        },
        separatorBuilder: (context, index) =>
            const Padding(padding: EdgeInsets.all(8)),
        itemCount: 5,
      ),
    );
  }
}
