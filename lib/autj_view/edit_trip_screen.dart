import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditTripScreen extends StatefulWidget {
  final String tripId;
  final Map<String, dynamic> tripData;

  const EditTripScreen({
    super.key,
    required this.tripId,
    required this.tripData,
  });

  @override
  State<EditTripScreen> createState() => _EditTripScreenState();
}

class _EditTripScreenState extends State<EditTripScreen> {
  late TextEditingController titleController;
  late TextEditingController locationController;
  late TextEditingController descriptionController;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    if (widget.tripId.isEmpty) {
      throw Exception("Trip ID is empty. Pass doc.id");
    }

    titleController = TextEditingController(
      text: widget.tripData['title'] ?? '',
    );
    locationController = TextEditingController(
      text: widget.tripData['location'] ?? '',
    );
    descriptionController = TextEditingController(
      text: widget.tripData['description'] ?? '',
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Trip"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: isLoading ? null : _confirmDelete,
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _field("Title", titleController),
                const SizedBox(height: 12),
                _field("Location", locationController),
                const SizedBox(height: 12),
                _field("Description", descriptionController, maxLines: 4),
                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _updateTrip,
                    child: const Text("Update Trip"),
                  ),
                ),
              ],
            ),
          ),

          if (isLoading)
            Container(
              color: Colors.black26,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  Widget _field(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// 🔄 UPDATE
  Future<void> _updateTrip() async {
    if (titleController.text.trim().isEmpty ||
        locationController.text.trim().isEmpty) {
      _msg("Title & Location required");
      return;
    }

    setState(() => isLoading = true);

    try {
      await FirebaseFirestore.instance
          .collection('trips')
          .doc(widget.tripId)
          .update({
            'title': titleController.text.trim(),
            'location': locationController.text.trim(),
            'description': descriptionController.text.trim(),
            'updatedAt': FieldValue.serverTimestamp(),
          });

      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      _msg("Update failed: $e");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  /// ❌ DELETE
  Future<void> _deleteTrip() async {
    setState(() => isLoading = true);

    try {
      await FirebaseFirestore.instance
          .collection('trips')
          .doc(widget.tripId)
          .delete();

      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      _msg("Delete failed: $e");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Trip"),
        content: const Text("Are you sure?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteTrip();
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _msg(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
