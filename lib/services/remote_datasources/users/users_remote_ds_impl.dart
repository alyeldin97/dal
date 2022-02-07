import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects_template/configs/constants/api_urls.dart';
import 'package:projects_template/models/user.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/remote_datasources/users/users_remote_ds.dart';

class UsersRemoteDataSourceImplFirebase implements UsersRemoteDataSource {
  @override
  Future<void> createUserInDatabase(UserModel userModel) async {
    try {
      DocumentReference<Map<String, dynamic>> currentUserDoc =
          FireBaseCollectionRefernces.usersCollection.doc(userModel.id);

      await currentUserDoc.set(userModel.toMap());
    } catch (e) {
      throw defaultFailure();
    }
  }

  @override
  Future<void> updateUserInDatabase(UserModel userModel) async {
    try {
      DocumentReference<Map<String, dynamic>> currentUserDoc =
          FireBaseCollectionRefernces.usersCollection.doc(userModel.id);
      print('remote 1');
      await currentUserDoc
          .update(userModel.toMap())
          .timeout(const Duration(seconds: 60));
    } catch (e) {
      if (e is TimeoutException) {
        throw socketFailure();
      }
      throw defaultFailure();
    }
  }

  @override
  Future<UserModel> getUserFromDataBase(String id) async {
    try {
      DocumentReference<Map<String, dynamic>> currentUserDoc =
          FireBaseCollectionRefernces.usersCollection.doc(id);

      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await currentUserDoc.get();
      UserModel userModel = UserModel.fromMap(snapshot.data()!);
      return userModel;
    } catch (e) {
      throw defaultFailure();
    }
  }

  @override
  Future<bool> userExists(String id) async {
    try {
      DocumentReference<Map<String, dynamic>> currentUserDoc =
          FireBaseCollectionRefernces.usersCollection.doc(id);

      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await currentUserDoc.get();
      bool docExists = snapshot.exists;

      return docExists;
    } catch (e) {
      throw defaultFailure();
    }
  }
}
