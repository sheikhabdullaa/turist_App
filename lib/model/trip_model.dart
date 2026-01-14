import 'package:cloud_firestore/cloud_firestore.dart'; // if using Firestore

class Trip {
  final String tripId;
  final String userId;
  final String accommodation;
  final String budgetEstimate; 
  final String category;
  final String username;
  final DateTime createdAt;
  final String description;
  final DateTime endDate;
  final int members;
  final DateTime startDate;
  final String transport; 
  final bool withFamily;
  final bool withFriends;

  Trip({
    required this.tripId,
    required this.userId,
    required this.accommodation,
    required this.budgetEstimate,
    required this.category,
    required this.createdAt,
    required this.description,
    required this.endDate,
    required this.members,
    required this.username,
    required this.startDate,
    required this.transport,
    required this.withFamily,
    required this.withFriends,
  });

 factory Trip.fromJson(Map<String, dynamic> json) {
  return Trip(
    tripId: json['tripId'] as String? ?? '',
    userId: json['userId'] as String? ?? '',
    accommodation: json['accommodation'] as String? ?? '',          // ← fix here
    budgetEstimate: json['budgetEstimate'] as String? ?? '0',
    category: json['category'] as String? ?? '',
    username: json['username'] as String? ?? 'Unknown',
    createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    description: json['description'] as String? ?? '',
    endDate: (json['endDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
    members: (json['members'] as num?)?.toInt() ?? 0,
    startDate: (json['startDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
    transport: json['transport'] as String? ?? '',
    withFamily: json['withFamily'] as bool? ?? false,
    withFriends: json['withFriends'] as bool? ?? false,
  );
}

  Map<String, dynamic> toJson() {
    return {
      'tripId': tripId,
      'userId': userId,
      'accommodation': accommodation,
      'budgetEstimate': budgetEstimate,
      'category': category,
      'createdAt': Timestamp.fromDate(createdAt),
      'description': description,
      'endDate': Timestamp.fromDate(endDate),
      'members': members,
      'startDate': Timestamp.fromDate(startDate),
      'transport': transport,
      'withFamily': withFamily,
      'withFriends': withFriends,
    };
  }
 }
