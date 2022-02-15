import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:projects_template/configs/constants/api_urls.dart';
import 'package:projects_template/services/errors/failure.dart';

import 'images_upload_remote_ds.dart';

class ImageUploadRemoteDataSourceFirebaseImpl
    implements ImageUploadRemoteDataSource {
  firebase_storage.FirebaseStorage firebaseStorage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<String> uploadProfileImage(File file) async {
    try {
      firebase_storage.Reference reference =
          firebaseStorage.ref(FirebaseConstants.firestorage_profile_images);

      firebase_storage.UploadTask uploadTask = reference.putFile(file);

      return uploadTask
          .then((firebase_storage.TaskSnapshot taskSnapshot) async {
        String url = await taskSnapshot.ref.getDownloadURL();
        return url;
      }).catchError((error) {
        throw defaultFailure();
      });
    } catch (e) {
      throw defaultFailure();
    }
  }
}
