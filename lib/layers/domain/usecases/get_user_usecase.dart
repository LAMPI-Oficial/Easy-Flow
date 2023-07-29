// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easyflow/layers/domain/entities/user_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_user_repository.dart';

abstract class GetUserUsecase {
  Future<UserEntity> call();
}

class GetUserUsecaseImpl implements GetUserUsecase {
  final GetUserRepository getUserRepository;
  GetUserUsecaseImpl({
    required this.getUserRepository,
  });

  @override
  Future<UserEntity> call() async {
    return getUserRepository();
  }
}
