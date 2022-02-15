import 'dart:io';

abstract class ImageUploadRemoteDataSource {
  Future<String> uploadProfileImage(File file);
}
