import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects_template/configs/constants/failure.dart';
import 'package:projects_template/services/errors/failure.dart';

Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getDocsFromCollection(
    collection) async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collection.get();
    bool dataIsFromCache = querySnapshot.metadata.isFromCache;

    if (dataIsFromCache) {
      throw socketFailure();
    }

    return querySnapshot.docs;
  } catch (e) {
    if (e is Failure && e.code == FailureCodes.socket) {
      rethrow;
    } else {
      throw defaultFailure();
    }
  }
}

CollectionReference<Map<String, dynamic>>
      getCollectionFromDocumentInCollection({
    required String baseCollectionName,
    required String docName,
    required String childCollectionName,
  }) {
    return FirebaseFirestore.instance
        .collection(baseCollectionName)
        .doc(docName)
        .collection(childCollectionName);
  }

