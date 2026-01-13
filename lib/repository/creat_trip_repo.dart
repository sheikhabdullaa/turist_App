import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreatTripRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> creatTrip(
    Map<String, dynamic> creatTripInfo,
    String tripId,
  ) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }

    await _firestore
        .collection("creattripuser")
        .doc(user.uid)
        .collection("trips")
        .doc(tripId)
        .set({...creatTripInfo, "userId": user.uid});
  }

  Future<Stream<QuerySnapshot>> creattripdetails() async {
    return  FirebaseFirestore.instance
        .collection('creattripuser')
        .snapshots();
  }
}
