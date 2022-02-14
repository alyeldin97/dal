import 'package:cloud_firestore/cloud_firestore.dart';

class APIUrls {
  static const woocommerce = 'example.com/w3/';
}

class FireBaseCollectionRefernces {
  static const _users = 'users';
  static const posts = 'posts';
  static const categories = 'categories';
  static final usersCollection = FirebaseFirestore.instance.collection(_users);
  static final categoriesCollection =
      FirebaseFirestore.instance.collection(categories);
}

class FirebaseConstants {
  static const posts = 'posts';
  static const firestorage_profile_images = '/profile_images';
}
