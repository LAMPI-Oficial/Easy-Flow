import 'package:easyflow/core/utils/validators_util.dart';
import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:easyflow/layers/domain/entities/study_area_entity.dart';
import 'package:easyflow/layers/presentation/controller/profile_controller.dart';
import 'package:easyflow/layers/presentation/ui/widgets/button_text_field_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/circle_avatar_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/listtile_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/listview/listview_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/modals_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  final controller = GetIt.I.get<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getUser(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Perfil",
              ),
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 130,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xFF0085FF),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 70,
                            color: const Color(0xFF0085FF),
                          ),
                          Container(
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(
                                  8,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 20,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              shape: BoxShape.circle),
                          child: CircleAvatarWidget(
                            maxRadius: 100,
                            urlPhoto:
                                controller.dataUser?.person.urlPhoto ?? "",
                            name: controller.dataUser?.person.name ?? "Andeson",
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 18,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 85),
                          child: InkWell(
                            onTap: () => Modals.imagePicker(context,
                                onChoosePhoto: () => controller
                                    .pickerPhoto(context,
                                        imageSource: ImageSource.gallery)
                                    .then((value) => controller.dataUser?.person
                                        .urlPhoto = value?.path),
                                onTakePhoto: () => controller
                                    .pickerPhoto(context,
                                        imageSource: ImageSource.camera)
                                    .then((value) => controller.dataUser?.person.urlPhoto = value?.path)),
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0085FF),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Icon(
                                Icons.add_photo_alternate_outlined,
                                color: Colors.white,
                                size: 12,
                                fill: 0.5,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      color: const Color(0xFFFFFFFF),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                    label: Text('Nome Completo'),
                                  ),
                                  controller:
                                      controller.nameTextEditingController,
                                  textInputAction: TextInputAction.next,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    label: Text('E-mail'),
                                  ),
                                  controller:
                                      controller.emailTextEditingController,
                                  textInputAction: TextInputAction.next,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                ButtonTextFieldWidget(
                                  validator: (value) =>
                                      Validators.isNotEmpty(value),
                                  onTap: () => Modals.page(
                                    context: context,
                                    title: const Text('Selecione o curso'),
                                    body: SafeArea(
                                      child: ListViewWidget<CourseEntity>(
                                        searchFieldEnabled: true,
                                        padding: const EdgeInsets.all(16),
                                        asyncListFilter: (value, list) => list
                                            .where(
                                              (element) => element.name
                                                  .toLowerCase()
                                                  .contains(
                                                      value.toLowerCase()),
                                            )
                                            .toList(),
                                        onRefresh: () =>
                                            controller.getCourses(),
                                        asyncListCallback: () =>
                                            controller.getCourses(),
                                        separatorBuilder: (p0, p1) =>
                                            const SizedBox(
                                          height: 16,
                                        ),
                                        builder: (courseBuilder) =>
                                            ListTileWidget(
                                          selected: courseBuilder.id ==
                                                  controller.course?.id
                                              ? true
                                              : false,
                                          title: Text(courseBuilder.name),
                                          onTap: () {
                                            controller
                                                .selectCourse(courseBuilder);
                                            context.pop();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  label: 'Curso',
                                  controller:
                                      controller.courseTextEditingController,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                ButtonTextFieldWidget(
                                  validator: (value) =>
                                      Validators.isNotEmpty(value),
                                  onTap: () => Modals.page(
                                    context: context,
                                    title: const Text(
                                        'Selecione a area de estudo'),
                                    body: SafeArea(
                                      child: ListViewWidget<StudyAreaEntity>(
                                        searchFieldEnabled: true,
                                        padding: const EdgeInsets.all(16),
                                        asyncListFilter: (value, list) => list
                                            .where(
                                              (element) => element.name
                                                  .toLowerCase()
                                                  .contains(
                                                      value.toLowerCase()),
                                            )
                                            .toList(),
                                        onRefresh: () =>
                                            controller.getStudyAreas(),
                                        asyncListCallback: () =>
                                            controller.getStudyAreas(),
                                        separatorBuilder: (p0, p1) =>
                                            const SizedBox(
                                          height: 16,
                                        ),
                                        builder: (studyAreaBuilder) =>
                                            ListTileWidget(
                                          selected: studyAreaBuilder.id ==
                                                  controller.studyArea?.id
                                              ? true
                                              : false,
                                          title: Text(studyAreaBuilder.name),
                                          onTap: () {
                                            controller.selectStudyArea(
                                                studyAreaBuilder);

                                            context.pop();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  label: 'Aréa de estudo',
                                  controller:
                                      controller.studyAreaTextEditingController,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () => controller.updateUser(context),
                      child: const Text(
                        'Salvar',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
