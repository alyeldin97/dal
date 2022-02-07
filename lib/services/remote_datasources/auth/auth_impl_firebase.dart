import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projects_template/configs/constants/failure.dart';
import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/configs/constants/json_keys.dart';
import 'package:projects_template/entities/login.dart';
import 'package:projects_template/entities/register.dart';
import 'package:projects_template/models/user.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/remote_datasources/auth/auth.dart';
import 'error_handler.dart';

class AuthRemoteDataSourceFirebaseImpl implements AuthRemoteDataSource {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  AuthRemoteDataSourceFirebaseImpl();

  @override
  Future<String> signInWithEmailAndPassword(
      {required LoginUserEntity loginUserEntity}) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: loginUserEntity.email,
        password: loginUserEntity.password,
      );
      String id = userCredential.user!.uid;
      return id;
    } on FirebaseAuthException catch (firebaseAuthException) {
      if (firebaseAuthException.code == 'network-request-failed') {
        throw socketFailure();
      } else {
        throw signInWithEmailAndPasswordErrorHandler(firebaseAuthException);
      }
    } on SocketException catch (e) {
      throw socketFailure();
    } catch (e) {
      throw defaultFailure();
    }
  }

  @override
  Future<UserModel?> signInWithFacebook() async {
    try {
      LoginResult loginResult = await FacebookAuth.instance.login(permissions: [
        'public_profile',
        'email',
      ], loginBehavior: LoginBehavior.webOnly);
      bool userHasLoggedIn = loginResult.status == LoginStatus.success;

      if (userHasLoggedIn) {
        final userFacebookData = await FacebookAuth.instance.getUserData();

        final credential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        UserModel userModel = await _signInWithCredentials(credential,
            userFacebookData[JsonKeys.email], userFacebookData[JsonKeys.name]);

        return userModel;
      } else {
        throw Failure(
            message: FailureMessages.facebookCancelled,
            code: FailureCodes.facebookCancelled);
      }
    } on FirebaseAuthException catch (firebaseAuthException) {
      if (firebaseAuthException.code == 'network-request-failed') {
        throw socketFailure();
      } else {
        throw createUserWithCredntialsErrorHandler(firebaseAuthException);
      }
    } on SocketException catch (e) {
      throw socketFailure();
    } catch (e) {
      if (e is Failure) {
        rethrow;
      }

      throw defaultFailure();
    }
  }

  @override
  Future<UserModel?> signInWithGoogle() async {
    try {
      final googleSignin = GoogleSignIn();
      GoogleSignInAccount? userGoogleAccount = await googleSignin.signIn();
      bool userHasLoggedIn = userGoogleAccount != null;
      
      if (userHasLoggedIn) {
        final googleAuth = await userGoogleAccount.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        UserModel userModel = await _signInWithCredentials(
            credential, userGoogleAccount.email, userGoogleAccount.displayName);

        return userModel;
      } else {

        throw socketFailure();
      }
    } on FirebaseAuthException catch (firebaseAuthException) {
      if (firebaseAuthException.code == 'network-request-failed') {
        throw socketFailure();
      } else {
        throw createUserWithCredntialsErrorHandler(firebaseAuthException);
      }
    } on SocketException catch (_) {
      throw socketFailure();
    } catch (e) {
      if (e is PlatformException || e is SocketException) {
        throw socketFailure();
      } else {
        throw defaultFailure();
      }
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword(
      {required RegisterUserEntity registerUserEntity}) async {
    try {
      var userCredentials = await firebaseAuth.createUserWithEmailAndPassword(
        email: registerUserEntity.email,
        password: registerUserEntity.password,
      );
      return UserModel(
          email: registerUserEntity.email,
          name: registerUserEntity.name,
          phoneNumber: registerUserEntity.phoneNumber,
          id: userCredentials.user!.uid,
          isMale: registerUserEntity.isMale,
          address: '',
          reviews: [],
          imageUrl: registerUserEntity.isMale
              ? NetWorkImagesUrls.defaultProfileImageMale
              : NetWorkImagesUrls.defaultProfileImageFemale);
    } on FirebaseAuthException catch (firebaseAuthException) {
      if (firebaseAuthException.code == 'network-request-failed') {
        throw socketFailure();
      } else {
        throw createUserWithEmailAndPasswordErrorHandler(firebaseAuthException);
      }
    } on SocketException catch (e) {
      throw socketFailure();
    } catch (e) {
      throw defaultFailure();
    }
  }

  Future<UserModel> _signInWithCredentials(credential, email, name) async {
    UserCredential firebaseUserCredential =
        await firebaseAuth.signInWithCredential(credential);
    String id = firebaseUserCredential.user!.uid;

    UserModel userModel = UserModel(
        email: email,
        id: id,
        address: '',
        name: name!,
        isMale: true,
        reviews: [],
        imageUrl: NetWorkImagesUrls.defaultProfileImageMale,
        phoneNumber: '');

    return userModel;
  }
}
