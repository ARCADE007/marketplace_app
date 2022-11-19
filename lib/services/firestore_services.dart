import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace/consts/firebase_consts.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirestoreServices {
  static getArtists(category) {
    return firestore
        .collection(artistsCollection)
        .where('category', isEqualTo: category)
        .snapshots();
  }
}
