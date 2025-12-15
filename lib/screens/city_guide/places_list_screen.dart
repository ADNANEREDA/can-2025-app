// lib/screens/city_guide/places_list_screen.dart

import 'package:flutter/material.dart';
import '../../core/constants.dart';
import '../../models/place_model.dart';
import '../../widgets/place_list_card.dart';

class PlacesListScreen extends StatelessWidget {
  final String title;
  final List<Place> places;

  const PlacesListScreen({
    super.key,
    required this.title,
    required this.places,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMarocDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: places.isEmpty
          ? Center(
              child: Text(
                "No places found yet.",
                style: TextStyle(color: Colors.grey.shade500),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: places.length,
              itemBuilder: (context, index) {
                return PlaceListCard(place: places[index]);
              },
            ),
    );
  }
}
