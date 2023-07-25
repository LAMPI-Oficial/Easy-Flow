import 'package:easyflow/layers/data/datasources/get_user_datasource.dart';
import 'package:easyflow/layers/domain/entities/user_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_user_repository.dart';

class GetUserRepositoryImpl implements GetUserRepository{
  final GetUserDataSource getUserDataSource;
  GetUserRepositoryImpl(this.getUserDataSource);
  @override
  Future<UserEntity> call() async{
    return getUserDataSource();
  }
}