import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditTripScreen extends StatefulWidget {
  final String tripId; // MUST be doc.id
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

    /// Safety check (prevents empty id crash)
    if (widget.tripId.isEmpty) {
      throw Exception("Trip ID is empty. Pass doc.id from previous screen.");
    }

    titleController =
        TextEditingController(text: widget.tripData['title'] ?? '');
    locationController =
        TextEditingController(text: widget.tripData['location'] ?? '');
    descriptionController =
        TextEditingController(text: widget.tripData['description'] ?? '');
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
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: isLoading ? null : _confirmDelete,
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _inputField(
                  label: "Trip Title",
                  controller: titleController,
                ),
                const SizedBox(height: 12),
                _inputField(
                  label: "Location",
                  controller: locationController,
                ),
                const SizedBox(height: 12),
                _inputField(
                  label: "Description",
                  controller: descriptionController,
                  maxLines: 4,
                ),
                const SizedBox(height: 30),

                /// UPDATE BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _updateTrip,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "Update Trip",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// LOADING OVERLAY
          if (isLoading)
            Container(
              color: Colors.black26,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  /// ---------- UI FIELD ----------
  Widget _inputField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  /// ---------- UPDATE ----------
  Future<void> _updateTrip() async {
    if (titleController.text.trim().isEmpty ||
        locationController.text.trim().isEmpty) {
      _showMessage("Title and Location cannot be empty");
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

      _showMessage("Trip updated successfully");
      Navigator.pop(context, true);
    } catch (e) {
      _showMessage("Update failed: $e");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  /// ---------- CONFIRM DELETE ----------
  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: const Text("Delete Trip"),
        content: const Text(
          "Are you sure you want to delete this trip?",
        ),
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
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  /// ---------- DELETE ----------
  Future<void> _deleteTrip() async {
    setState(() => isLoading = true);

    try {
      await FirebaseFirestore.instance
          .collection('trips')
          .doc(widget.tripId)
          .delete();

      if (!mounted) return;

      _showMessage("Trip deleted");
      Navigator.pop(context, true);
    } catch (e) {
      _showMessage("Delete failed: $e");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  /// ---------- SNACKBAR ----------
  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }
}
