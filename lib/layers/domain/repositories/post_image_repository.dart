abstract class PostImageRepository {
  Future<String?> call(String imagePath, String imageName);
}
