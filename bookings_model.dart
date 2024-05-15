import 'package:hostel_one/data/hostels.dart';

class Booking {
  final String userEmail;
  final HostelData hostel;
  final String bookingTime;
  final bool isPaid;

  Booking({
    required this.userEmail,
    required this.hostel,
    required this.bookingTime,
    required this.isPaid,
  });

  Map<String, dynamic> toMap() {
    return {
      'userEmail': userEmail,
      'hostel': hostel.toJson(),
      'bookingTime': bookingTime,
      'isPaid': isPaid,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      userEmail: map['userEmail'],
      hostel: HostelData.fromJson(map['hostel']),
      bookingTime: map['bookingTime'],
      isPaid: map['isPaid'] ?? false,
    );
  }

  Booking copyWith({
    String? userEmail,
    HostelData? hostel,
    String? bookingTime,
    bool? isPaid,
  }) {
    return Booking(
      userEmail: userEmail ?? this.userEmail,
      hostel: hostel ?? this.hostel,
      bookingTime: bookingTime ?? this.bookingTime,
      isPaid: isPaid ?? this.isPaid,
    );
  }
}
