import 'package:cloud_firestore/cloud_firestore.dart';

class Trip {
  final String tripId;
  final String userId;
  final String username;
  final String location;
  final String category;
  final String transport;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime createdAt;
  final int members;

  // Expenses
  final int budgetEstimate;
  final int totalSpendExpense;
  final int perPersonExpense;
  final int hotelExpense;
  final int transportationExpense;
  final int dinnerExpense;

  Trip({
    required this.tripId,
    required this.userId,
    required this.username,
    required this.location,
    required this.category,
    required this.transport,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.members,
    required this.budgetEstimate,
    required this.totalSpendExpense,
    required this.perPersonExpense,
    required this.hotelExpense,
    required this.transportationExpense,
    required this.dinnerExpense,
  });

  // Helper Functions
  static int parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  static DateTime parseTimestamp(dynamic value) {
    if (value == null) return DateTime.now(); // default
    if (value is Timestamp) return value.toDate();
    return DateTime.now();
  }

  //From JSON
  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      tripId: json['tripId'] ?? '',
      userId: json['userId'] ?? '',
      username: json['username'] ?? '',
      location: json['location'] ?? '',
      category: json['category'] ?? '',
      transport: json['transport'] ?? '',
      startDate: parseTimestamp(json['startDate']),
      endDate: parseTimestamp(json['endDate']),
      createdAt: parseTimestamp(json['createdAt']),
      members: parseInt(json['members']),

      // Expenses
      budgetEstimate: parseInt(
        json['budgetEstimate'] ?? json['budget eastimate'],
      ),
      totalSpendExpense: parseInt(
        json['totalSpendExpense'] ?? json['total spend expence'],
      ),
      perPersonExpense: parseInt(
        json['perPersonExpense'] ?? json['perperson expence'],
      ),
      hotelExpense: parseInt(json['hotelExpense'] ?? json['hotel expence']),
      transportationExpense: parseInt(
        json['transportationExpense'] ?? json['transportation'],
      ),
      dinnerExpense: parseInt(json['dinnerExpense'] ?? json['dinner expence']),
    );
  }

  //  To JSON
  Map<String, dynamic> toJson() => {
    'tripId': tripId,
    'userId': userId,
    'username': username,
    'location': location,
    'category': category,
    'transport': transport,
    'startDate': Timestamp.fromDate(startDate),
    'endDate': Timestamp.fromDate(endDate),
    'createdAt': Timestamp.fromDate(createdAt),
    'members': members,

    // Expenses
    'budgetEstimate': budgetEstimate,
    'totalSpendExpense': totalSpendExpense,
    'perPersonExpense': perPersonExpense,
    'hotelExpense': hotelExpense,
    'transportationExpense': transportationExpense,
    'dinnerExpense': dinnerExpense,
  };
}
