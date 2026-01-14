import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreatTripRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createTrip(Map<String, dynamic> tripData, String tripId) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }

    await _firestore.collection("creattripuser").doc(tripId).set({
      ...tripData,
      'userId': user.uid,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> activeTripsStream() {
    final user = _auth.currentUser;
    if (user == null) {
      return const Stream.empty(); 
    }

    return _firestore
        .collection("creattripuser")
        .where('userId', isEqualTo: user.uid)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class CreatTripRepo {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> creatTrip(
//     Map<String, dynamic> creatTripInfo,
//     String tripId,
//   ) async {
//     final user = _auth.currentUser;

//     if (user == null) {
//       throw Exception("User not logged in");
//     }

//     await _firestore
//         .collection("creattripuser")
//         .doc(user.uid)
//         .collection("trips");

//     // .doc(tripId)
//   }

//   Future<Stream<QuerySnapshot>> creattripdetails() async {
//     return FirebaseFirestore.instance.collection('creattripuser').snapshots();
//   }
// }
