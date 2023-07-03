import 'package:easyflow/layers/data/datasources/authenticate_user_datasource.dart';
import 'package:easyflow/layers/data/datasources/create_person_datasource.dart';
import 'package:easyflow/layers/data/datasources/get_courses_datasource.dart';
import 'package:easyflow/layers/data/datasources/get_study_areas_datasource.dart';
import 'package:easyflow/layers/data/datasources/remote/authenticate_user_datasource_impl.dart';
import 'package:easyflow/layers/data/datasources/remote/create_person_datasource_impl.dart';
import 'package:easyflow/layers/data/datasources/remote/get_courses_datasource_impl.dart';
import 'package:easyflow/layers/data/datasources/remote/get_study_areas_datasource_impl.dart';
import 'package:easyflow/layers/data/repositories/authenticate_user_repository_impl.dart';
import 'package:easyflow/layers/data/repositories/create_person_repository_impl.dart';
import 'package:easyflow/layers/data/repositories/get_courses_repository_impl.dart';
import 'package:easyflow/layers/data/repositories/get_study_areas_repository_impl.dart';
import 'package:easyflow/layers/domain/repositories/authenticate_user_repository.dart';
import 'package:easyflow/layers/domain/repositories/create_person_repository.dart';
import 'package:easyflow/layers/domain/repositories/get_courses_repository.dart';
import 'package:easyflow/layers/domain/repositories/get_study_areas_repository.dart';
import 'package:easyflow/layers/domain/usecases/authenticate_user_usecase.dart';
import 'package:easyflow/layers/domain/usecases/create_person_usecase.dart';
import 'package:easyflow/layers/domain/usecases/get_courses_usecase.dart';
import 'package:easyflow/layers/domain/usecases/get_study_areas_usecase.dart';
import 'package:easyflow/layers/presentation/controller/complaint_controller.dart';
import 'package:easyflow/layers/presentation/controller/daily_controller.dart';
import 'package:easyflow/layers/presentation/controller/profile_controller.dart';
import 'package:easyflow/layers/presentation/controller/user_controller.dart';
import 'package:easyflow/layers/presentation/ui/pages/equipment/equipment_controller.dart';
import 'package:easyflow/layers/presentation/controller/forgot_password_controller.dart';
import 'package:easyflow/layers/presentation/controller/home_controller.dart';
import 'package:easyflow/layers/presentation/controller/schedule_controller.dart';
import 'package:easyflow/layers/presentation/controller/sign_up_controller.dart';
import 'package:get_it/get_it.dart';

import '../../layers/presentation/provider/user_provider.dart';

class Inject {
  static void init() {
    _initDatasources();
    _initRepositores();
    _initUseCases();
    _initControllers();
    _initProviders();
  }

  static void _initDatasources() {
    GetIt getIt = GetIt.instance;

    // DATASOURCES
    getIt.registerLazySingleton<AuthenticateUserDatasource>(
      () => AuthenticateUserDatasourceImpl(),
    );

    getIt.registerLazySingleton<CreatePersonDatasource>(
      () => CreatePersonDatasourceImpl(),
    );

    getIt.registerLazySingleton<GetCoursesDataSource>(
      () => GetCoursesDataSourceImpl(),
    );
       getIt.registerLazySingleton<GetStudyAreasDataSource>(
      () => GetStudyAreasDataSourceImpl(),
    );
  }

  static void _initRepositores() {
    GetIt getIt = GetIt.instance;

    // REPOSITORIES
    getIt.registerLazySingleton<AuthenticateUserRepository>(
      () => AuthenticateUserRepositoryImpl(getIt()),
    );

    getIt.registerLazySingleton<CreatePersonRepository>(
        () => CreatePersonRepositoryImpl(getIt()));

    getIt.registerLazySingleton<GetCoursesRepository>(
      () => GetCoursesRepositoryImpl(getIt()),
    );
       getIt.registerLazySingleton<GetStudyAreasRepository>(
      () => GetStudyAreasRepositoryImpl(getIt()),
    );
  }

  static void _initUseCases() {
    GetIt getIt = GetIt.instance;

    // USERCASES
    getIt.registerLazySingleton<AuthenticateUserUseCase>(
      () => AuthenticateUserUseCaseImpl(getIt()),
    );
    getIt.registerLazySingleton<CreatePersonUseCase>(
      () => CreatePersonUseCaseImpl(getIt()),
    );
    getIt.registerLazySingleton<GetCoursesUseCase>(
      () => GetCoursesUseCaseImpl(getIt()),
    );
      getIt.registerLazySingleton<GetStudyAreasUseCase>(
      () => GetStudyAreasUseCaseImpl(getIt()),
    );
  }

  static void _initControllers() {
    GetIt getIt = GetIt.instance;

    //CONTROLLERS
        getIt.registerFactory<UserController>(
      () => UserController(
getIt(),getIt(),
      ),
    );

    getIt.registerFactory<SignUpController>(
      () => SignUpController(

        getIt(),  getIt(),getIt(),
      ),
    );

    getIt.registerFactory<EquipmentController>(() => EquipmentController());

    getIt.registerFactory<ProfileController>(() => ProfileController(getIt(),getIt(),));

    getIt.registerFactory<DailyController>(
        () => DailyController( ));

    getIt.registerFactory<ComplaintController>(() => ComplaintController());

    getIt.registerFactory<ForgotPasswordController>(
        () => ForgotPasswordController());

    getIt.registerFactory<HomeController>(() => HomeController());

    getIt.registerFactory<ScheduleController>(() => ScheduleController());
  }

  static _initProviders() {
    GetIt getIt = GetIt.instance;

    getIt.registerSingleton<UserProvider>(
      UserProvider(),
    );
  }
}
