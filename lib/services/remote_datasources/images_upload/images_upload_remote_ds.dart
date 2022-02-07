import 'dart:io';

abstract class ImageUploadRemoteDataSource {
  Future<String> uploadImage(File file);
}
