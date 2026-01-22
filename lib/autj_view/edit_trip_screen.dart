import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:turist_app/model/trip_model.dart';

class EditTripScreen extends StatelessWidget {
  final Trip trip;

  const EditTripScreen({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: trip.location);

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Trip')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('trips')
                    .doc(trip.docId)
                    .update({'location': controller.text});
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}