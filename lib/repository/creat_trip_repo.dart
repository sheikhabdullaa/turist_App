import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:turist_app/model/trip_model.dart';

class CreatTripRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createTrip(Map<String, dynamic> tripData, String tripId) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }
    final data = await _firestore.collection('signupuser').doc(user.uid).get();
    final userData = data.data();
    await _firestore.collection("creattripuser").doc(tripId).set({
      ...tripData,
      'userId': user.uid,
      'username': userData?['name'] ?? '',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<List<Trip?>> activeTripsGet() async {
    final data = await _firestore.collection("creattripuser").get();

    return data.docs.map((doc) {
      final json = doc.data();
      log("our data is $json");
      return Trip.fromJson(json);
    }).toList();
  }
}
