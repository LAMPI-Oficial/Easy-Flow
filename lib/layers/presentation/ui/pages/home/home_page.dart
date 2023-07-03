import 'package:easyflow/layers/domain/entities/announcements_model.dart';
import 'package:easyflow/layers/domain/entities/representative_model.dart';
import 'package:easyflow/layers/presentation/controller/home_controller.dart';
import 'package:easyflow/layers/presentation/ui/widgets/announcements_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/representative_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/listview/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = GetIt.I.get<HomeController>();
  TabController? _controllerTab;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.push('/menu'),
            icon: const Icon(Icons.menu),
          ),
          title: const Text('Inicio'),
          bottom: TabBar(
            controller: _controllerTab,
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            indicatorPadding: const EdgeInsets.symmetric(
              horizontal: -10,
              vertical: 10,
            ),
            unselectedLabelColor: Colors.white,
            labelColor: Theme.of(context).primaryColor,
            labelStyle: const TextStyle(
              fontSize: 13,
            ),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ),
              color: Colors.white,
            ),
            tabs: const [
              Tab(
                text: "Comunicados",
              ),
              Tab(
                text: "Representantes",
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: _controllerTab,
            children: [
              ListViewWidget(
                padding: const EdgeInsets.all(16),
                separatorBuilder: (p0, p1) => const SizedBox(
                  height: 16,
                ),
                onRefresh: () => controller.getAnnouncements(),
                asyncListCallback: () => controller.getAnnouncements(),
                builder: (AnnouncementsModel announcements) =>
                    AnnouncementsWidget(
                  announcements: announcements,
                  representative: announcements.representative,
                ),
              ),
              ListViewWidget<RepresentativeModel>(
                onRefresh: () => controller.getRepresentatives(),
                padding: const EdgeInsets.all(16),
                separatorBuilder: (p0, p1) => const SizedBox(
                  height: 16,
                ),
                asyncListCallback: () => controller.getRepresentatives(),
                asyncListFilter: (value, list) => list
                    .where(
                      (element) => element.name
                          .toLowerCase()
                          .contains(value.toLowerCase()),
                    )
                    .toList(),
                builder: (RepresentativeModel representative) =>
                    RepresentativeWidget(representative: representative),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
