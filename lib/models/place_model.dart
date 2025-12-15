// lib/models/place_model.dart

enum PlaceType { hotel, restaurant, attraction, transport }

class Place {
  final String id;
  final String name;
  final String imagePath;
  final PlaceType type;
  final double rating;
  final String description;
  final String locationInfo;

  final String? phoneNumber;
  final String? mapUrl;

  Place({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.type,
    this.rating = 0.0,
    required this.description,
    required this.locationInfo,
    this.phoneNumber,
    this.mapUrl,
  });
}
