import 'package:cloud_firestore/cloud_firestore.dart'; // if using Firestore

class Trip {
  final String tripId;
  final String userId;
  final String accommodation;
  final int budget;
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
  final String location;
bool? isfavorite;
bool? isnotfavorite;


  Trip({
    required this.tripId,
    required this.userId,
    required this.accommodation,
    required this.budget,
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
    required this.location,
    required this.isfavorite,
    required this.isnotfavorite,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      tripId: json['tripId'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      accommodation: json['accommodation'] as String? ?? '', 
      budget: (json['budgetEstimate'] as num?)?.toInt() ?? 0,
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
      location: json['location'] as String? ?? '',
      isfavorite: json['isfavorite'] as bool? ?? true,
      isnotfavorite: json['isnotfavorite'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tripId': tripId,
      'userId': userId,
      'accommodation': accommodation,
      'budgetEstimate': budget,
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
