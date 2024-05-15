class HostelData {
  final String name;
  final String location;
  final int price;
  final List<String>? imageUrls;
  final List<String>? videoUrls; // Add attribute for video URLs
  final List<String> facilities;

  HostelData({
    required this.name,
    required this.location,
    required this.price,
    required this.facilities,
    this.imageUrls,
    this.videoUrls,
  });

  factory HostelData.fromJson(Map<String, dynamic> json) {
    return HostelData(
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      price: json['price'] ?? 0,
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      videoUrls: List<String>.from(json['videoUrls'] ?? []),
      facilities: List<String>.from(json['facilities'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'price': price,
      'imageUrls': imageUrls,
      'videoUrls': videoUrls,
      'facilities': facilities,
    };
  }
}





/*
class HostelData {
  // Model
  final String name;
  final String location;
  final int price;
  final List<String>? imageUrls; // Changed to list of URLs
  final List<String> facilities;

  HostelData({
    required this.name,
    required this.location,
    required this.price,
    required this.facilities,
    required this.imageUrls, // Updated attribute name
  });

  // Convert a Map<String, dynamic> to a HostelData instance
  factory HostelData.fromJson(Map<String, dynamic> json) {
    return HostelData(
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      price: json['price'] ?? 0,
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      facilities: List<String>.from(json['facilities'] ?? []),
    );
  }

  // Convert a HostelData instance to a Map<String, dynamic>
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'price': price,
      'imageUrls': imageUrls, // Updated attribute name
      'facilities': facilities,
    };
  }
}
*/