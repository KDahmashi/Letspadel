import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {

  final String? courtId;
  final String city;
  final String? user;
  final String court;
  final Timestamp createAt;
  final String status;
  final int duration;
  final Timestamp date;
  final String? time;

  BookingModel({
    required this.courtId,
    required this.city,
    required this.user,
    required this.court,
    required this.createAt,
    required this.status,
    required this.duration,
    required this.date,
    required this.time,
  });

  // Convert from JSON
  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      courtId: json['courtId'] as String,
      city: json['city'] as String,
      user: json['user'] as String,
      court: json['court'] as String,
      createAt: json['createAt'] as Timestamp,
      status: json['status'] as String,
      duration: json['duration'] as int,
      // date: (json['date'] as Timestamp).toDate(),
      date: json['date'] as Timestamp,
      time: json['time'] as String,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'courtId': courtId,
      'city': city,
      'user': user,
      'court': court,
      'createAt': createAt,
      'status': status,
      'duration': duration,
      'date': date,
      'time': time,
    };
  }
}