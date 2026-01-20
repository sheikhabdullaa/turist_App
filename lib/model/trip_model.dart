// import 'package:cloud_firestore/cloud_firestore.dart'; // if using Firestore

// class Trip {
//   final String tripId;
//   final String userId;
//   final String accommodation;
//   final int budgeteastimatr;
//   final String category;
//   final String username;
//   final DateTime createdAt;
//   final String description;
//   final DateTime endDate;
//   final int members;
//   final DateTime startDate;
//   final String transport;
//   final bool withFamily;
//   final bool withFriends;
//   final String location;
//   final String totalSpendExpence;
//   final String personSpendExpence;
// bool? isfavorite;
// bool? isnotfavorite;


//   Trip({
//     required this.tripId,
//     required this.userId,
//     required this.accommodation,
//     required this.budgeteastimatr,
//     required this.category,
//     required this.createdAt,
//     required this.description,
//     required this.endDate,
//     required this.members,
//     required this.username,
//     required this.startDate,
//     required this.transport,
//     required this.withFamily,
//     required this.withFriends,
//     required this.location,
//     required this.isfavorite,
//     required this.isnotfavorite,
//     required this.totalSpendExpence,
//     required this.personSpendExpence,
//   });

//   factory Trip.fromJson(Map<String, dynamic> json) {
//     return Trip(
//       tripId: json['tripId'] as String? ?? '',
//       userId: json['userId'] as String? ?? '',
//       accommodation: json['accommodation'] as String? ?? '', 
//       budgeteastimatr: (json['budgetEstimate'] as num?)?.toInt() ?? 0,
//       category: json['category'] as String? ?? '',
//       username: json['username'] as String? ?? 'Unknown',
//       createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
//       description: json['description'] as String? ?? '',
//       endDate: (json['endDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
//       members: (json['members'] as num?)?.toInt() ?? 0,
//       startDate: (json['startDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
//       transport: json['transport'] as String? ?? '',
//       withFamily: json['withFamily'] as bool? ?? false,
//       withFriends: json['withFriends'] as bool? ?? false,
//       location: json['location'] as String? ?? '',
//       isfavorite: json['isfavorite'] as bool? ?? true,
//       isnotfavorite: json['isnotfavorite'] as bool? ?? false,
//       totalSpendExpence: json['totalSpendExpence'] as String? ?? '',
//       personSpendExpence: json['personSpendExpence'] as String? ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'tripId': tripId,
//       'userId': userId,
//       'accommodation': accommodation,
//       'budgetEstimate': budgeteastimatr,
//       'category': category,
//       'createdAt': Timestamp.fromDate(createdAt),
//       'description': description,
//       'endDate': Timestamp.fromDate(endDate),
//       'members': members,
//       'startDate': Timestamp.fromDate(startDate),
//       'transport': transport,
//       'withFamily': withFamily,
//       'withFriends': withFriends,
//       'location': location,
//       'isfavorite': isfavorite,
//       'totalSpendExpence': totalSpendExpence, 
//       'personSpendExpence': personSpendExpence,
//     };
//   }
// }


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

  factory Trip.fromJson(Map<String, dynamic> json) {
    int parseInt(dynamic value) {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is double) return value.toInt();
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }

    return Trip(
      tripId: json['tripId'] ?? '',
      userId: json['userId'] ?? '',
      username: json['username'] ?? '',
      location: json['location'] ?? '',
      category: json['category'] ?? '',
      transport: json['transport'] ?? '',
      startDate: (json['startDate'] as Timestamp).toDate(),
      endDate: (json['endDate'] as Timestamp).toDate(),
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      members: parseInt(json['members']),

      // Expenses
      budgetEstimate: parseInt(json['budgetEstimate'] ?? json['budget eastimate']),
      totalSpendExpense: parseInt(json['totalSpendExpense'] ?? json['total spend expence']),
      perPersonExpense: parseInt(json['perPersonExpense'] ?? json['perperson expence']),
      hotelExpense: parseInt(json['hotelExpense'] ?? json['hoitel expence']),
      transportationExpense: parseInt(json['transportationExpense'] ?? json['transportation']),
      dinnerExpense: parseInt(json['dinnerExpense'] ?? json['dinner expence']),
    );
  }

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
