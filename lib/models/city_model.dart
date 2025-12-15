// lib/models/city_model.dart

import 'place_model.dart';

class City {
  final String id;
  final String name;
  final String imagePath;

  final String stadiumName;
  final String stadiumImage;
  final String stadiumDescription;
  final String stadiumMapUrl;

  final List<Place> hotels;
  final List<Place> restaurants;
  final List<Place> attractions;
  final List<Place> transports;

  final String policeNumber;
  final String ambulanceNumber;

  City({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.stadiumName,
    required this.stadiumImage,
    required this.stadiumDescription,
    required this.stadiumMapUrl,
    this.hotels = const [],
    this.restaurants = const [],
    this.attractions = const [],
    this.transports = const [],
    this.policeNumber = '190',
    this.ambulanceNumber = '150',
  });
}
