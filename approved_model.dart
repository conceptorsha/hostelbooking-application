import 'hostels.dart';

class ApprovedBooking {
  final String userEmail;
  final HostelData hostelData;
  final String approvedDate;

  ApprovedBooking({
    required this.userEmail,
    required this.hostelData,
    required this.approvedDate,
  });

  // Convert ApprovedBooking object to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'userEmail': userEmail,
      'hostel': hostelData.toJson(), // Convert hostelData to JSON
      'approvedDate': approvedDate,
    };
  }

  // Factory method to create ApprovedBooking object from JSON
  factory ApprovedBooking.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('json must not be null');
    }
    return ApprovedBooking(
      // Provide a default value if null
      userEmail: json['userEmail'] ?? '', // Provide a default value if null
      hostelData: HostelData.fromJson(
          json['hostel'] ?? {}), // Provide an empty map as default if null
      approvedDate:
          json['approvedDate'] ?? '', // Provide a default value if null
    );
  }
}
