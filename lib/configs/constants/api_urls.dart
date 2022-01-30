import 'package:cloud_firestore/cloud_firestore.dart';

class APIUrls {
  static const woocommerce = 'example.com/w3/';
}

class FireBaseCollectionRefernces {
  static const _users = 'users';
  static const _categories = 'categories';



  static final usersCollection = FirebaseFirestore.instance.collection(_users);
  static final categoriesCollection = FirebaseFirestore.instance.collection(_categories);

}

class FirebaseConstants{
  static const posts = 'posts';
}
