import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace/consts/firebase_consts.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirestoreServices {
  static getArtistsByCategory(category, location) {
    return firestore
        .collection(artistsCollection)
        .where('category', isEqualTo: category)
        .where('location', isEqualTo: location)
        .snapshots();
  }
}
