import 'package:easyflow/layers/domain/repositories/post_image_repository.dart';

abstract class PostImageUseCase {
  Future<String?> call(String imagePath, String imageName);
}

class PostImageUseCaseImpl implements PostImageUseCase {
  final PostImageRepository postImageRepository;
  PostImageUseCaseImpl(this.postImageRepository);
  @override
  Future<String?> call(String imagePath, String imageName) {
    return postImageRepository(imagePath, imageName);
  }
}
