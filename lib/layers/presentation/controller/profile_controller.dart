import 'package:easyflow/layers/data/dto/user_dto.dart';
import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:easyflow/layers/domain/entities/person_entity.dart';
import 'package:easyflow/layers/domain/entities/study_area_entity.dart';
import 'package:easyflow/layers/domain/entities/user_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:easyflow/layers/domain/usecases/get_courses_usecase.dart';
import 'package:easyflow/layers/domain/usecases/get_study_areas_usecase.dart';
import 'package:easyflow/layers/domain/usecases/get_user_usecase.dart';
import 'package:easyflow/layers/domain/usecases/put_user_usercase.dart';
import 'package:easyflow/layers/presentation/ui/widgets/dialogs_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController {
  final GetCoursesUseCase _getCoursesIdUseCase;
  final GetStudyAreasUseCase _getStudyAreasUseCase;
  final GetUserUsecase _getUserUsecase;
  final PatchUserUserCase _patchUserUserCase;

  ProfileController(this._getCoursesIdUseCase, this._getStudyAreasUseCase,
      this._getUserUsecase, this._patchUserUserCase);
  final formKey = GlobalKey<FormState>();
  UserEntity? dataUser;

  CourseEntity? course;
  StudyAreaEntity? studyArea;
  String urlPhoto = "";
  TextEditingController nameTextEditingController =
      TextEditingController(text: "");
  TextEditingController emailTextEditingController =
      TextEditingController(text: "");
  TextEditingController courseTextEditingController =
      TextEditingController(text: "");
  TextEditingController studyAreaTextEditingController =
      TextEditingController(text: "");

  Future<List<CourseEntity>> getCourses() async {
    return _getCoursesIdUseCase.call();
  }

  Future<List<StudyAreaEntity>> getStudyAreas() async {
    return _getStudyAreasUseCase.call();
  }

  Future getUser(BuildContext context) async {
    try {
      return _getUserUsecase.call().then((value) {
        dataUser = value;
        emailTextEditingController.text = dataUser!.person.email;
        nameTextEditingController.text = dataUser!.person.name;
        urlPhoto =
            "https://s2-techtudo.glbimg.com/Bxr-QA4_gL25CarCCxr9JQFybt8=/0x0:1024x609/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2022/c/u/15eppqSmeTdHkoAKM0Uw/dall-e-2.jpg";
        course = dataUser!.course;
        courseTextEditingController.text = course!.name;
        studyArea = dataUser!.studyArea;
        studyAreaTextEditingController.text = studyArea!.name;
      });
    } on ApiException catch (e) {
      Navigator.of(context).pop();
      Dialogs.error(context, title: e.title, message: e.message);
    }
  }

  selectCourse(newCourse) {
    course = newCourse;
    courseTextEditingController.text = course!.name;
  }

  selectStudyArea(newstudyArea) {
    studyArea = newstudyArea;
    studyAreaTextEditingController.text = studyArea!.name;
  }

  Future<XFile?> pickerPhoto(context,
      {required ImageSource imageSource}) async {
    return ImagePicker().pickImage(source: imageSource);
  }

  updateUser(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      Dialogs.loading(context);
      try {
        final pacthUser = UserDto(
          id: dataUser!.id,
          token: dataUser!.token,
          login: emailTextEditingController.text,
          person: PersonEntity(
            id: dataUser!.id,
            urlPhoto:
                "https://s2-techtudo.glbimg.com/Bxr-QA4_gL25CarCCxr9JQFybt8=/0x0:1024x609/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2022/c/u/15eppqSmeTdHkoAKM0Uw/dall-e-2.jpg",
            name: nameTextEditingController.text,
            email: emailTextEditingController.text,
            admin: dataUser!.person.admin,
            personType: dataUser!.person.personType,
          ),
          course: course!,
          studyArea: studyArea!,
        );
        _patchUserUserCase.call(pacthUser).then((value) {
          context.pushReplacement('/home');
        });
      } on ApiException catch (e) {
        Navigator.of(context).pop();
        Dialogs.error(context, title: e.title, message: e.message);
      }
    }
  }
}
